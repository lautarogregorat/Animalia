package com.example.animaliabackjava.Controller;

import com.example.animaliabackjava.Dominio.Consultas;
import com.example.animaliabackjava.RequestDTO.ConsultaCreatedDTO;
import com.example.animaliabackjava.RequestDTO.ConsultaImgUpdateDTO;
import com.example.animaliabackjava.RequestDTO.ConsultaUpdateDTO;
import com.example.animaliabackjava.ResponseDTO.ConsultaImgDTO;
import com.example.animaliabackjava.ResponseDTO.ConsultasListaDTO;
import com.example.animaliabackjava.ResponseDTO.ConsultasResponseDto;
import com.example.animaliabackjava.Services.ConsultaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@CrossOrigin(origins = "http://animaliaveterinaria:4173")
//@CrossOrigin(origins = "http://localhost:5173") apuntar al contenedor del frontend
@RestController
@RequestMapping("/consultas")
public class ConsultasController {

    private final ConsultaService consultasService;
    @Autowired
    public ConsultasController(ConsultaService consultasService) {
        this.consultasService = consultasService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getAllConsultasById(@PathVariable int id) {
        try {
            List<ConsultasListaDTO> consultas = consultasService.getAllConsultasById(id);
            return ResponseEntity.ok().body(consultas);
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/registrar/{id}")
    public ResponseEntity<Object> createdConsultabyId(@RequestBody @Valid ConsultaCreatedDTO dto, @PathVariable int id, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(new ConsultasListaDTO(consultasService.createdConsultabyId(dto, id)));
        }catch (NoSuchElementException e){
            return ResponseEntity.badRequest().body("El id de paciente no existe");
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping(params = {"idPaciente", "idConsulta"})
    public ResponseEntity<Object> getAllConsultasByIdPaciente(@RequestParam(name="idPaciente") int idPaciente, @RequestParam(name="idConsulta") int idConsulta) {
        try {
             Optional<Consultas> consulta =consultasService.getConsultaById(idConsulta, idPaciente);
                if(consulta.isEmpty()){
                    return ResponseEntity.badRequest().body("El id de consulta no existe o paciente no existe");
                }
            return ResponseEntity.ok().body(new ConsultasListaDTO(consulta.get()));
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping(value="imagenes", params = {"idPaciente", "idConsulta"})
    public ResponseEntity<Object> getImgConsultasByIdPaciente(@RequestParam(name="idPaciente") int idPaciente, @RequestParam(name="idConsulta") int idConsulta) {
        try {
            Optional<Consultas> consulta =consultasService.getConsultaById(idConsulta, idPaciente);
            if(consulta.isEmpty()){
                return ResponseEntity.badRequest().body("El id de consulta no existe o paciente no existe");
            }
            return ResponseEntity.ok().body(new ConsultaImgDTO(consulta.get()));
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }



    @PutMapping(value = "/actualizar", params = {"idPaciente", "idConsulta"})
    public ResponseEntity<Object> updateConsulta(@RequestBody @Valid ConsultaUpdateDTO dto, @RequestParam(name="idPaciente") int idPaciente, @RequestParam(name="idConsulta") int idConsulta, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(new ConsultasListaDTO(consultasService.updateConsulta(dto, idConsulta, idPaciente)));
        }catch (NoSuchElementException e){
            return ResponseEntity.badRequest().body("El id de consulta no existe");
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping(value = "/actualizarFoto", params = {"idPaciente", "idConsulta"})
    public ResponseEntity<Object> updateImgConsulta(@RequestBody @Valid ConsultaImgUpdateDTO dto, @RequestParam(name="idPaciente") int idPaciente, @RequestParam(name="idConsulta") int idConsulta, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.getFieldError().getDefaultMessage());
        }
        try {
            return ResponseEntity.ok().body(new ConsultasResponseDto(consultasService.updateImgConsulta(dto, idConsulta, idPaciente)));
        }catch (NoSuchElementException e){
            return ResponseEntity.badRequest().body("El id de consulta no existe");
        }
        catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    @DeleteMapping("/eliminar/{idConsulta}")
    public ResponseEntity<Object> deleteConsulta( @PathVariable int idConsulta) {
        try {
            consultasService.delete(idConsulta);
            return ResponseEntity.ok().body("Consulta eliminada");
        }catch (NoSuchElementException e){
            return ResponseEntity.badRequest().body("El id de consulta no existe");
        }
        catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
