package com.example.animaliabackjava.Dominio;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Responsables {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idResponsable")
    private int idResponsable;
    @Basic
    @Column(name = "nombre")
    private String nombre;
    @Basic
    @Column(name = "apellido")
    private String apellido;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "telefono")
    private long telefono;
    @OneToMany(mappedBy = "responsablesByResponsableId")
    @JsonIgnore
    private List<Pacientes> pacientesByIdResponsable = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Responsables that = (Responsables) o;
        return idResponsable == that.idResponsable && Objects.equals(nombre, that.nombre) && Objects.equals(apellido, that.apellido) && Objects.equals(email, that.email);
    }
    @Override
    public int hashCode() {
        return Objects.hash(idResponsable, nombre, apellido, email);
    }

}
