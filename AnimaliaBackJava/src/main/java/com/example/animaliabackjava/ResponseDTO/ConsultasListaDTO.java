package com.example.animaliabackjava.ResponseDTO;

import com.example.animaliabackjava.Dominio.Consultas;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Base64;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ConsultasListaDTO {
    private int id;
    private String fecha;
    private String descripcion;
    private String titulo;
    private String fechaModificacion;
    private String pdfLink;

    public ConsultasListaDTO(Consultas consulta) {
        this.id = consulta.getIdConsulta();
        this.fecha = consulta.getFecha();
        this.descripcion = consulta.getDescripcion();
        this.titulo = consulta.getTitulo();
        this.fechaModificacion = consulta.getFechaModificacion();
        this.pdfLink = consulta.getPdflink();
    }
}
