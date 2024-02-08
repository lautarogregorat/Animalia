package com.example.animaliabackjava.ResponseDTO;

import com.example.animaliabackjava.Dominio.Responsables;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponsableResponse {
    private int id;
    private String nombre;
    private String apellido;
    private String email;
    private long telefono;

    public ResponsableResponse(Responsables responsables) {
        this.id = responsables.getIdResponsable();
        this.nombre = responsables.getNombre();
        this.apellido = responsables.getApellido();
        this.email = responsables.getEmail();
        this.telefono = responsables.getTelefono();
    }
}
