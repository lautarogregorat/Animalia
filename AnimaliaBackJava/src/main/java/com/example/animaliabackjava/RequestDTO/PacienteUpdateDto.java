package com.example.animaliabackjava.RequestDTO;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PacienteUpdateDto {
    @Valid
    @NotBlank(message = "El nombre no puede estar vacio")
    private String nombre;
    private String raza;
    private String especie;
    private String sexo;
    private String fechaNacimiento;
    private int esterilizado;
    private String descripcion;
    private String foto;
    private int responsableId;
    private String nombreResponsable;
    private String apellidoResponsable;
    private String emailResponsable;
    private long telefonoResponsable;
}
