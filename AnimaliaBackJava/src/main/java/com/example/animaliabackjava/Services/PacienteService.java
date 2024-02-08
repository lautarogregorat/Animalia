package com.example.animaliabackjava.Services;

import com.example.animaliabackjava.Dominio.Pacientes;
import com.example.animaliabackjava.Dominio.Responsables;
import com.example.animaliabackjava.Repository.ConsultaRepo;
import com.example.animaliabackjava.Repository.PacienteRepo;
import com.example.animaliabackjava.RequestDTO.ImagenUpdateDTO;
import com.example.animaliabackjava.RequestDTO.PacienteCreatedDTO;
import com.example.animaliabackjava.RequestDTO.PacienteUpdateDto;
import com.example.animaliabackjava.RequestDTO.ResponsableUpdateDTO;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PacienteService {
    private PacienteRepo pacienteRepo;
    private ResponsableService responsableService;
    private ConsultaRepo consultaRepo;
    @Autowired
    public PacienteService(PacienteRepo pacienteRepo, ResponsableService responsableService, ConsultaRepo consultaRepo) {
        this.pacienteRepo = pacienteRepo;
        this.responsableService = responsableService;
        this.consultaRepo = consultaRepo;
    }
    public List<Pacientes> getAllPacientes() {
        return pacienteRepo.findAll();
    }

    public Pacientes createPaciente(PacienteCreatedDTO pacienteDto) {
        Pacientes paciente = new Pacientes();
        paciente.setNombre(pacienteDto.getNombre());
        paciente.setSexo(pacienteDto.getSexo());
        paciente.setFechaNacimiento(pacienteDto.getFechaNacimiento());
        paciente.setEsterilizado(pacienteDto.getEsterilizado());
        paciente.setRaza(pacienteDto.getRaza());
        paciente.setEspecie(pacienteDto.getEspecie());
        paciente.setDescripcion(pacienteDto.getDescripcion());
        paciente.setFoto(processBase64Image(pacienteDto.getFoto()));

        if (pacienteDto.getResponsableId() == 0) {
            Responsables responsable = responsableService.created(pacienteDto);
            paciente.setResponsableId(responsable.getIdResponsable());
            paciente.setResponsablesByResponsableId(responsable);
            responsable.getPacientesByIdResponsable().add(paciente);
            return pacienteRepo.save(paciente);
        }
        int idPaciente = pacienteDto.getResponsableId();
        Optional<Responsables> responsableOptional = responsableService.getResponsableById(idPaciente);
        if(responsableOptional.isEmpty()) {
            throw new NoSuchElementException("El id de responsable no existe");
        }
        Responsables responsable = responsableOptional.get();
        paciente.setResponsableId(idPaciente);
        paciente.setResponsablesByResponsableId(responsable);
        responsable.getPacientesByIdResponsable().add(paciente);

        return pacienteRepo.save(paciente);
    }

    public Optional<Pacientes> getPacienteById(int id) {
        Optional<Pacientes> paciente = pacienteRepo.findById(id);
        return paciente.isEmpty()
                ?Optional.empty()
                :Optional.of(paciente.get());
    }

    public Pacientes updatePaciente(PacienteUpdateDto pacienteDto, int idPaciente)  {
        Optional<Pacientes> pacienteOptional = getPacienteById(idPaciente);
        if(pacienteOptional.isEmpty()) {
            throw new NoSuchElementException("El id de paciente no existe");
        }
        Pacientes paciente = pacienteOptional.get();
        paciente.setNombre(pacienteDto.getNombre());
        paciente.setSexo(pacienteDto.getSexo());
        paciente.setEsterilizado(pacienteDto.getEsterilizado());
        paciente.setFechaNacimiento(pacienteDto.getFechaNacimiento());
        paciente.setDescripcion(pacienteDto.getDescripcion());
        paciente.setFoto(Base64.getDecoder().decode(pacienteDto.getFoto()));
        paciente.setRaza(pacienteDto.getRaza());
        paciente.setEspecie(pacienteDto.getEspecie());

        return pacienteRepo.save(paciente);
    }
    @Transactional
    public boolean delete(int id) {
        if(!pacienteRepo.existsById(id)){
            throw new NoSuchElementException("El id de paciente no existe");
        }
        consultaRepo.deleteConsultasByPacienteId(id);
        pacienteRepo.deleteById(id);
        return true;
    }

    public Object updatePacienteImagen(ImagenUpdateDTO img, int id) {
        Optional<Pacientes> pacienteOptional = getPacienteById(id);
        if(pacienteOptional.isEmpty()) {
            throw new NoSuchElementException("El id de paciente no existe");
        }
        Pacientes paciente = pacienteOptional.get();
        paciente.setFoto(processBase64Image(img.getFoto()));
        return pacienteRepo.save(paciente);
    }

    private byte[] processBase64Image(String base64Image) {
        if (base64Image != null) {
            if (!base64Image.startsWith("data:image/jpeg;base64,")) {
                throw new IllegalArgumentException("Invalid data URL");
            }
            base64Image = base64Image.substring("data:image/jpeg;base64,".length());
            return Base64.getDecoder().decode(base64Image);
        }
        return null;
    }

    public Responsables updateResponsable(ResponsableUpdateDTO responsableDto, int idPaciente) {
        Optional <Responsables> responsableOptional = responsableService.getResponsableById(responsableDto.getIdResponsable());
        if (responsableOptional.isEmpty()) {
            throw new NoSuchElementException("El id de responsable no existe");
        }
        Responsables responsable = responsableOptional.get();

        if (Objects.equals(responsableDto.getExiste(), "1")) {
            Optional <Responsables> responsableOptionalNuevo = responsableService.getResponsableById(responsableDto.getIdResponsableNuevo());
            if (responsableOptionalNuevo.isEmpty()) {
                throw new NoSuchElementException("El id de responsable no existe");
            }
            Responsables responsableNuevo = responsableOptionalNuevo.get();

            Optional <Pacientes> pacienteOptional = this.getPacienteById(idPaciente);
            if (pacienteOptional.isEmpty()) {
                throw new NoSuchElementException("El id de paciente no existe");
            }
            Pacientes paciente = pacienteOptional.get();

            paciente.setResponsableId(responsableNuevo.getIdResponsable());
            paciente.setResponsablesByResponsableId(responsableNuevo);
            responsableNuevo.getPacientesByIdResponsable().add(paciente);
            responsable.getPacientesByIdResponsable().remove(paciente);

            responsableService.save(responsableNuevo);
            responsableService.save(responsable);
            pacienteRepo.save(paciente);
            return responsableNuevo;
        } else {
            return responsableService.updateResponsable(responsableDto, responsable);
        }


    }
}

