package com.example.animaliabackjava.Controller;

import com.example.animaliabackjava.Dominio.Pacientes;
import com.example.animaliabackjava.RequestDTO.ImagenUpdateDTO;
import com.example.animaliabackjava.RequestDTO.PacienteCreatedDTO;
import com.example.animaliabackjava.RequestDTO.PacienteUpdateDto;
import com.example.animaliabackjava.RequestDTO.ResponsableUpdateDTO;
import com.example.animaliabackjava.ResponseDTO.PacienteDTO;
import com.example.animaliabackjava.ResponseDTO.PacienteListaDTO;
import com.example.animaliabackjava.Services.PacienteService;
import jakarta.validation.Valid;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.ObjectError;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://animaliaveterinaria.com.ar:4173")
@RestController
@RequestMapping("/pacientes")
public class PacienteController {

    private final PacienteService pacienteService;
    @Autowired
    public PacienteController(PacienteService pacienteService) {
        this.pacienteService = pacienteService;
    }

    @GetMapping
    public ResponseEntity<Object> getAllPacientes() {
        try {
            List <PacienteListaDTO> pacientes = pacienteService.getAllPacientes().stream().map(PacienteListaDTO::new).toList();
            return ResponseEntity.ok().body(pacientes);
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    @GetMapping("/{id}")
    public ResponseEntity<Object> getPacienteById(@PathVariable int id) {
        try {
            Optional<Pacientes> paciente = pacienteService.getPacienteById(id);
            return paciente.isEmpty()
                    ?ResponseEntity.noContent().build()
                    :ResponseEntity.ok().body(new PacienteDTO(paciente.get()));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> updatePaciente(@PathVariable int id, @RequestBody @Valid PacienteUpdateDto pacienteUpdatedDTO, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(pacienteService.updatePaciente(pacienteUpdatedDTO, id));
        }catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
    @PutMapping("/editImagen/{id}")
    public ResponseEntity<Object> updatePacienteImagen(@PathVariable int id, @RequestBody @Valid ImagenUpdateDTO img, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(pacienteService.updatePacienteImagen(img, id));
        }catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<Object> createPaciente(@RequestBody @Valid PacienteCreatedDTO pacienteCreatedDTO, BindingResult result) {
        if (result.hasErrors()) {
            List<String> errorMessages = result.getAllErrors().stream()
                    .map(ObjectError::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest().body(errorMessages);
        }
        try {
            return ResponseEntity.ok().body(pacienteService.createPaciente(pacienteCreatedDTO));
        }catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletePaciente(@PathVariable int id) {
        try {
            pacienteService.delete(id);
            return ResponseEntity.ok().build();
        }catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    @PutMapping("/actualizarResponsable/{idPaciente}")
    public ResponseEntity<Object> updateResponsable(@PathVariable int idPaciente, @RequestBody @Valid ResponsableUpdateDTO responsableUpdateDTO, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(pacienteService.updateResponsable(responsableUpdateDTO, idPaciente));
        }catch (NoSuchElementException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
}
