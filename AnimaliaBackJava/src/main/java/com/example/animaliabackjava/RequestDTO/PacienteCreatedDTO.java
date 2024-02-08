package com.example.animaliabackjava.RequestDTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PacienteCreatedDTO {
    @Valid
    @NotEmpty(message = "El nombre no puede estar vacio")
    @NotBlank(message = "El nombre no puede estar vacio")
    private String nombre;
    private String raza;
    private String especie;
    private String sexo;
    private String fechaNacimiento;
    private int esterilizado;
    private String descripcion;
    private String foto;
    @Valid
    @NotNull(message = "El id del responsable no puede estar vacio")
    private int responsableId;
    @Valid
    @NotBlank(message = "El nombre del responsable no puede estar vacio")
    private String nombreResponsable;
    private String apellidoResponsable;
    private String emailResponsable;
    private long telefonoResponsable;

}
