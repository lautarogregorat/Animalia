package com.example.animaliabackjava.RequestDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResponsableUpdateDTO {
    private String nombre;
    private String apellido;
    private String email;
    private long telefono;
    private int idResponsable;
    private int idResponsableNuevo;
    private String existe; // si es un cambio de responsable existe es igual a 1.

}
