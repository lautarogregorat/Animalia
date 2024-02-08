package com.example.animaliabackjava.ResponseDTO;

import com.example.animaliabackjava.Dominio.Consultas;
import lombok.Getter;
import lombok.Setter;

import java.util.Base64;
@Getter
@Setter
public class ConsultaImgDTO {

    private String foto;
    private String foto2;
    private int id;

    public ConsultaImgDTO(Consultas consulta) {
        byte[] imageBytes = consulta.getFoto() == null ? null : consulta.getFoto();
        this.foto = imageBytes == null ? "" : Base64.getEncoder().encodeToString(imageBytes);
        byte[] imageBytes2 = consulta.getFoto2() == null ? null : consulta.getFoto2();
        this.foto2 = imageBytes2 == null ? "" : Base64.getEncoder().encodeToString(imageBytes2);
        this.id = consulta.getIdConsulta();
    }


}
