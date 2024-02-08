package com.example.animaliabackjava.Repository;

import com.example.animaliabackjava.Dominio.Consultas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ConsultaRepo extends JpaRepository<Consultas, Integer> {
    public List<Consultas> findConsultasByPacienteId(int id);
    public Optional<Consultas> findConsultasByIdConsultaAndPacienteId(int idConsulta, int idPaciente);

    @Modifying
    @Query(value = "DELETE FROM Consultas  c WHERE c.pacienteId = :pacienteId")
    void deleteConsultasByPacienteId(@Param("pacienteId") int pacienteId);
}
