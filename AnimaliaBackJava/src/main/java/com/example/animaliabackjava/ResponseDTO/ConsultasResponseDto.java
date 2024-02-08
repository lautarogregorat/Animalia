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
public class ConsultasResponseDto {
    private int id;
    private String fecha;
    private String descripcion;
    private String titulo;
    private String fechaModificacion;
    private String foto;
    private String foto2;

    public ConsultasResponseDto(Consultas consulta) {
        this.id = consulta.getIdConsulta();
        this.fecha = consulta.getFecha();
        this.descripcion = consulta.getDescripcion();
        this.titulo = consulta.getTitulo();
        this.fechaModificacion = consulta.getFechaModificacion();
        byte[] imageBytes = consulta.getFoto() == null ? null : consulta.getFoto();
        this.foto = imageBytes == null ? "" : Base64.getEncoder().encodeToString(imageBytes);

        byte[] imageBytes2 = consulta.getFoto2() == null ? null : consulta.getFoto2();
        this.foto2 = imageBytes2 == null ? "" : Base64.getEncoder().encodeToString(imageBytes2);

    }
}
