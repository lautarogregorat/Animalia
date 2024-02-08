package com.example.animaliabackjava.Controller;

import com.example.animaliabackjava.Dominio.Responsables;
import com.example.animaliabackjava.ResponseDTO.ResponsableResponse;
import com.example.animaliabackjava.Services.ResponsableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "http://localhost:4173")
@RestController
@RequestMapping("/responsables")
public class ResponsableController {
    private final ResponsableService responsableService;
    @Autowired
    public ResponsableController(ResponsableService responsableService) {
        this.responsableService = responsableService;
    }

    @GetMapping
    public ResponseEntity<Object> getAllResponsables() {
        try {
            return ResponseEntity.ok().body(responsableService.getAllResponsables());
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{idPaciente}")
    public ResponseEntity<Object> getResponsableById(@PathVariable int idPaciente) {
        try {
            Optional< Responsables > responsable = responsableService.getResponsableById(idPaciente);
            return responsable.isEmpty()
                    ?ResponseEntity.noContent().build()
                    :ResponseEntity.ok().body(new ResponsableResponse(responsable.get()));
        }catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
