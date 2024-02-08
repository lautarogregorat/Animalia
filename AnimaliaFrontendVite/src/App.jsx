import './App.css'
import Inicio from './componentes/Inicio'
import {BrowserRouter as Router, Routes, Route, } from "react-router-dom"
import ConsultarPaciente from './componentes/Pacientes/ConsultarPaciente';
import ActualizarPaciente from './componentes/Pacientes/ActualizarPaciente';
import RegistrarPaciente from './componentes/Pacientes/RegistrarPaciente';
import { Navigate } from 'react-router-dom'
import FormularioDescripcion from './componentes/Consultas/FormularioDescripcion';
import ConsultasConsultar from './componentes/Consultas/ConsultasConsultar';
import ConsultasActualizar from './componentes/Consultas/ConsultasActualizar';
import EditarImagen from './componentes/Pacientes/EditarImagen';
import VerImagenConsulta from './componentes/Consultas/VerImagenConsulta';
import ActualizarImgConsulta from './componentes/Consultas/ActualizarImgConsulta';
import ActualizarResponsable from './componentes/Responsables/ActualizarResponsable';

function App() {

  return (
    <>
      <Routes>
        <Route path="/" element={<Navigate to="/home" />} />
        <Route path="/home" element={<Inicio />} />
        <Route path="/pacientes/:id" element={<ConsultarPaciente />} />
        <Route path="/registrar" element={<RegistrarPaciente />} />
        <Route path="/pacientes/:id/editar" element={<ActualizarPaciente />} />
        <Route path="/pacientes/consultas/:id" element={<FormularioDescripcion />} />
        <Route path="/pacientes/fichas" element={<ConsultasConsultar />} />
        <Route path="/pacientes/fichas/actualizar" element={<ConsultasActualizar />} />
        <Route path="/pacientes/consultas/EditarImagen/:id" element={<EditarImagen />} />
        <Route path="/pacientes/consultas/Ver/Imagen/" element={<VerImagenConsulta />} />
        <Route path="/pacientes/fichas/actualizarImagen" element={<ActualizarImgConsulta />} />
        <Route path="/pacientes/editarResponsable" element={<ActualizarResponsable />} />
      </Routes>
    </>
  );
}

export default App;
