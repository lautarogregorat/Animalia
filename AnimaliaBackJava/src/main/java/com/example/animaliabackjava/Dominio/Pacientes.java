package com.example.animaliabackjava.Dominio;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Objects;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Pacientes {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "idPaciente")
    private int idPaciente;
    @Basic
    @Column(name = "nombre")
    private String nombre;
    @Basic
    @Column(name = "raza")
    private String raza;

    @Basic
    @Column(name = "sexo")
    private String sexo;
    @Basic
    @Column(name = "fechaNacimiento")
    private String fechaNacimiento;
    @Basic
    @Column(name = "fechaUltVisita")
    private String fechaUltVisita;

    @Basic
    @Column(name = "esterilizado")
    private int esterilizado;
    @Basic
    @Column(name = "descripcion")
    private String descripcion;
    @Basic
    @Column(name = "foto")
    private byte[] foto;
    @Basic
    @Column
    private String especie;
    @Basic
    @Column(name = "responsable_id")
    private Integer responsableId;
    @OneToMany(mappedBy = "pacientesByPacienteId")
    @JsonIgnore
    private Collection<Consultas> consultasByIdPaciente;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "responsable_id", referencedColumnName = "idResponsable", insertable=false, updatable=false)
    private Responsables responsablesByResponsableId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pacientes pacientes = (Pacientes) o;
        return idPaciente == pacientes.idPaciente && Objects.equals(nombre, pacientes.nombre) && Objects.equals(sexo, pacientes.sexo) && Objects.equals(fechaNacimiento, pacientes.fechaNacimiento) && Objects.equals(esterilizado, pacientes.esterilizado) && Objects.equals(descripcion, pacientes.descripcion) && Arrays.equals(foto, pacientes.foto) && Objects.equals(responsableId, pacientes.responsableId);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(idPaciente, nombre,  sexo, fechaNacimiento, esterilizado, descripcion, responsableId);
        result = 31 * result + Arrays.hashCode(foto);
        return result;
    }

    public int calcularEdad() {
        String fechaNacimientoString = this.getFechaNacimiento();
        if (fechaNacimientoString.isEmpty()) {
            return -1;
        }

        // Define el formato de la fecha
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // Convierte el String a un objeto Date
            Date parsedDate = dateFormat.parse(fechaNacimientoString);

            // Crea un Timestamp a partir del objeto Date
            Timestamp fechaNacimiento = new Timestamp(parsedDate.getTime());

            // Obtiene la fecha actual
            Timestamp fechaActual = new Timestamp(System.currentTimeMillis());

            // Calcula la diferencia en milisegundos
            long diferenciaEnMillis = fechaActual.getTime() - fechaNacimiento.getTime();

            // Convierte la diferencia a años (aproximado)
            int edad = (int) (diferenciaEnMillis / (365.25 * 24 * 60 * 60 * 1000));

            return edad;
        } catch (ParseException e) {
            e.printStackTrace();
            // Manejar la excepción, por ejemplo, lanzarla nuevamente o devolver un valor predeterminado.
        }

        return -1; // Valor predeterminado en caso de error
    }


}
