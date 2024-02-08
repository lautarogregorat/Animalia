package com.example.animaliabackjava.RequestDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ConsultaUpdateDTO {
    private String titulo;
    private String fechaModificacion;
    private String descripcion;
    private String pdfLink;
}
