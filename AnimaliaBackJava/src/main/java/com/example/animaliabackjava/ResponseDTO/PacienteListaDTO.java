package com.example.animaliabackjava.ResponseDTO;

import com.example.animaliabackjava.Dominio.Pacientes;
import com.example.animaliabackjava.Dominio.Responsables;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Base64;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PacienteListaDTO {
    private int idPaciente;
    private String nombre;
    private String fechaUltVisita;
    private int responsableId;
    private Responsables responsablesByResponsableId;

    public PacienteListaDTO(Pacientes paciente) {
        this.idPaciente = paciente.getIdPaciente();
        this.nombre = paciente.getNombre();
        this.responsableId = paciente.getResponsableId();
        this.responsablesByResponsableId = paciente.getResponsablesByResponsableId();
        this.fechaUltVisita = paciente.getFechaUltVisita();
    }
}
