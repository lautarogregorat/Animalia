package com.example.animaliabackjava.Repository;

import com.example.animaliabackjava.Dominio.Consultas;
import com.example.animaliabackjava.Dominio.Pacientes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PacienteRepo extends JpaRepository<Pacientes, Integer> {

}
