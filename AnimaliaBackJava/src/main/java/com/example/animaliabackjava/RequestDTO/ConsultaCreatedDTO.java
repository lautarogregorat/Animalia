package com.example.animaliabackjava.RequestDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ConsultaCreatedDTO {
    private String titulo;
    private String fecha;
    private String descripcion;
    private String pdflink;

}
