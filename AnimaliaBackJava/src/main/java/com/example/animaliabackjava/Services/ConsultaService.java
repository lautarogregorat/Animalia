package com.example.animaliabackjava.Services;

import com.example.animaliabackjava.Dominio.Consultas;
import com.example.animaliabackjava.Dominio.Pacientes;
import com.example.animaliabackjava.Repository.ConsultaRepo;
import com.example.animaliabackjava.Repository.PacienteRepo;
import com.example.animaliabackjava.RequestDTO.ConsultaCreatedDTO;
import com.example.animaliabackjava.RequestDTO.ConsultaImgUpdateDTO;
import com.example.animaliabackjava.RequestDTO.ConsultaUpdateDTO;
import com.example.animaliabackjava.ResponseDTO.ConsultasListaDTO;
import com.example.animaliabackjava.ResponseDTO.ConsultasResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ConsultaService {

    private final ConsultaRepo consultaRepo;
    private final PacienteService pacienteService;

    @Autowired
    public ConsultaService(ConsultaRepo consultaRepo, PacienteService pacienteService) {
        this.consultaRepo = consultaRepo;
        this.pacienteService = pacienteService;
    }

    public List<ConsultasListaDTO> getAllConsultasById(int id) {
        return consultaRepo.findConsultasByPacienteId(id).stream()
                .sorted(Comparator.comparing(Consultas::getFecha).reversed())
                .map(ConsultasListaDTO::new)
                .collect(Collectors.toList());
    }

    public Consultas createdConsultabyId(ConsultaCreatedDTO consultaDto, int id) {
        Optional<Pacientes> paciente = pacienteService.getPacienteById(id);
        if (paciente.isEmpty()) {
            throw new NoSuchElementException("El id de paciente no existe");
        }
        Consultas consulta = new Consultas();
        consulta.setFecha(consultaDto.getFecha());
        consulta.setDescripcion(consultaDto.getDescripcion());
        consulta.setTitulo(consultaDto.getTitulo());
        consulta.setFechaModificacion(consultaDto.getFecha());
        consulta.setFoto(null);
        consulta.setPdflink(consultaDto.getPdflink());
        consulta.setPacienteId(id);
        consulta.setPacientesByPacienteId(paciente.get());
        paciente.get().getConsultasByIdPaciente().add(consulta);
        paciente.get().setFechaUltVisita(consulta.getFecha()); // no hace falta guardar el paciente
        return consultaRepo.save(consulta);
    }

    public Consultas updateConsulta(ConsultaUpdateDTO consultaDto, int idConsulta, int idPaciente) {
        Optional<Consultas> consultaOptional = consultaRepo.findConsultasByIdConsultaAndPacienteId(idConsulta, idPaciente);
        if (consultaOptional.isEmpty()) {
            throw new NoSuchElementException("El id de consulta no existe");
        }
        Consultas consulta = consultaOptional.get();
        consulta.setFechaModificacion(consultaDto.getFechaModificacion());
        consulta.setDescripcion(consultaDto.getDescripcion());
        consulta.setTitulo(consultaDto.getTitulo());
        consulta.setPdflink(consultaDto.getPdfLink());
        return consultaRepo.save(consulta);
    }

    public Optional<Consultas> getConsultaById(int idConsulta, int idPaciente) {
        Optional<Consultas> consulta = consultaRepo.findConsultasByIdConsultaAndPacienteId(idConsulta, idPaciente);
        return consulta.isEmpty() ? Optional.empty() : Optional.of(consulta.get());
    }

    public Consultas updateImgConsulta(ConsultaImgUpdateDTO dto, int idConsulta, int idPaciente) {
        Optional<Consultas> consultaOptional = consultaRepo.findConsultasByIdConsultaAndPacienteId(idConsulta, idPaciente);
        if (consultaOptional.isEmpty()) {
            throw new NoSuchElementException("El id de consulta no existe");
        }
        Consultas consulta = consultaOptional.get();
        consulta.setFoto(processBase64Image(dto.getFoto()));
        consulta.setFoto2(processBase64Image(dto.getFoto2()));
        return consultaRepo.save(consulta);
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

    public boolean delete(int idConsulta) {
        if (!consultaRepo.existsById(idConsulta)) {
            throw new NoSuchElementException("El id de consulta no existe");
        }
        consultaRepo.deleteById(idConsulta);
        return true;
    }
};