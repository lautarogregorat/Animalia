import React from "react";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import InfoPaciente from "./InfoPaciente";
import { useParams } from "react-router-dom";
import axios from "axios";
import { useEffect } from "react";
import ConsultasLista from "../Consultas/ConsultasLista";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const ConsultarPaciente = () => {
  const { id } = useParams();
  const [mascotaData, setMascota] = React.useState({});
  const [openError, setOpenError] = React.useState(false);
  const authContext = useAuth();

  useEffect(() => {

    // Utilizamos una variable para rastrear si el componente está montado
    let isMounted = true;

    const getMascota = async () => {
      try {
        const response = await axios.get(
          `http://animaliaveterinaria.com.ar:8080/api/pacientes/${id}`,
          { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
        );
        //console.log("Respuesta del servidor:", response);
        // Verificamos si el componente está montado antes de actualizar el estado
        if (isMounted) {
          setMascota(response.data);
        }
      } catch (error) {
        console.error(error);
        setOpenError(true);
      }
    };

    getMascota();

    // Función de limpieza para indicar que el componente se ha desmontado
    return () => {
      isMounted = false;
    };
  }, []);


  return (
    <Container
      style={{ minHeight: "100vh", alignItems: "center", marginTop: "100px" }}
    >
      <Grid
        container
        spacing={5}
        justifyContent={"center"}
        alignItems={"flex-start"}
        sx={{ minHeight: "150vh" }}
      >
        {/* Información a la izquierda (12 columnas en dispositivos móviles, 6 en pantallas más grandes) */}
        <Grid item xs={12} sm={6}>
          {/* Contenedor para la información */}
          {/* Campos que muestran información uno debajo del otro */}
          <InfoPaciente mascota={mascotaData} />
          {/* Agrega más campos según sea necesario */}
        </Grid>
        <Grid item xs={12} sm={6}>
          <ConsultasLista id={id}></ConsultasLista>
        </Grid>
      </Grid>
      {openError && <AlertaError />}
    </Container>
  );
};

export default ConsultarPaciente;
