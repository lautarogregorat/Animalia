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
public class PacienteDTO {
    private int idPaciente;
    private String nombre;
    private String sexo;
    private String fechaNacimiento;
    private String fechaUltVisita;
    private int esterilizado;
    private String descripcion;
    private String especie;
    private int responsableId;
    private int edad;
    private String raza;
    private String foto;
    private Responsables responsablesByResponsableId;

    public PacienteDTO(Pacientes paciente) {
        this.idPaciente = paciente.getIdPaciente();
        this.nombre = paciente.getNombre();
        this.sexo = paciente.getSexo();
        this.fechaNacimiento = paciente.getFechaNacimiento();
        this.esterilizado = paciente.getEsterilizado();
        this.descripcion = paciente.getDescripcion();
        this.especie = paciente.getEspecie();
        this.responsableId = paciente.getResponsableId();
        this.responsablesByResponsableId = paciente.getResponsablesByResponsableId();
        this.edad = paciente.calcularEdad();
        this.raza = paciente.getRaza();
        this.fechaUltVisita = paciente.getFechaUltVisita();
        byte[] imageBytes = paciente.getFoto() == null ? null : paciente.getFoto();
        this.foto = imageBytes == null ? "" : Base64.getEncoder().encodeToString(imageBytes);
    }
}
