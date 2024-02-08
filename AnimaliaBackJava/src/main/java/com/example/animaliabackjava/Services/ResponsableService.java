package com.example.animaliabackjava.Services;

import com.example.animaliabackjava.Dominio.Responsables;
import com.example.animaliabackjava.Repository.ResponsableRepo;
import com.example.animaliabackjava.RequestDTO.PacienteCreatedDTO;
import com.example.animaliabackjava.RequestDTO.ResponsableUpdateDTO;
import com.example.animaliabackjava.ResponseDTO.ResponsableResponse;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ResponsableService {

    private final ResponsableRepo responsableRepo;
    public ResponsableService(ResponsableRepo responsableRepo) {
        this.responsableRepo = responsableRepo;
    }

    public Responsables created(PacienteCreatedDTO responsable) {
        Responsables responsables = new Responsables();
        responsables.setNombre(responsable.getNombreResponsable());
        responsables.setApellido(responsable.getApellidoResponsable());
        responsables.setTelefono(responsable.getTelefonoResponsable());
        responsables.setEmail(responsable.getEmailResponsable());
        return responsableRepo.save(responsables);
    }

    public Optional<Responsables> getResponsableById(int id) {
        Optional<Responsables> responsable = responsableRepo.findById(id);
        return responsable.isEmpty()
                ?Optional.empty()
                :Optional.of(responsable.get());
    }


    public List<ResponsableResponse> getAllResponsables() {
        return responsableRepo.findAll().stream()
                .sorted(Comparator.comparing(r -> r.getApellido()))
                .map(ResponsableResponse::new)
                .collect(Collectors.toList());
    }

    public Responsables updateResponsable(ResponsableUpdateDTO dto, Responsables responsable) {
        responsable.setNombre(dto.getNombre());
        responsable.setApellido(dto.getApellido());
        responsable.setEmail(dto.getEmail());
        responsable.setTelefono(dto.getTelefono());
        return responsableRepo.save(responsable);
    }

    public Responsables save( Responsables responsable) {
        return responsableRepo.save(responsable);
    }
}
