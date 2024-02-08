package com.example.animaliabackjava.Dominio;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Objects;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Consultas {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idConsulta")
    private int idConsulta;
    @Basic
    @Column(name="titulo")
    private String titulo;
    @Basic
    @Column(name = "fecha")
    private String fecha;
    @Basic
    @Column(name = "fechaModificacion")
    private String fechaModificacion;
    @Basic
    @Column(name = "descripcion")
    private String descripcion;
    @Basic
    @Column(name= "pdflink")
    private String pdflink;
    @Basic
    @Column(name = "foto")
    private byte[] foto;
    @Basic
    @Column(name = "foto2")
    private byte[] foto2;
    @Basic
    @Column(name = "paciente_id")
    private Integer pacienteId;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "paciente_id", referencedColumnName = "idPaciente", insertable=false, updatable=false)
    private Pacientes pacientesByPacienteId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Consultas consultas = (Consultas) o;
        return idConsulta == consultas.idConsulta && Objects.equals(fecha, consultas.fecha) && Objects.equals(descripcion, consultas.descripcion) && Arrays.equals(foto, consultas.foto) && Objects.equals(pacienteId, consultas.pacienteId);
    }
    @Override
    public int hashCode() {
        int result = Objects.hash(idConsulta, fecha, descripcion, pacienteId);
        result = 31 * result + Arrays.hashCode(foto);
        return result;
    }

}
