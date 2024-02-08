import React from "react";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import { useParams } from "react-router-dom";
import axios from "axios";
import { useEffect } from "react";
import Actualizar from "./Actualizar";
import { useNavigate } from "react-router-dom";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import { Box } from "@mui/system";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const ActualizarPaciente = () => {
  const { id } = useParams();
  const [mascotaData, setMascota] = React.useState({});
  const navigate = useNavigate();
  const [openError, setOpenError] = React.useState(false);
  const authContext = useAuth();

  useEffect(() => {
    // Utilizamos una variable para rastrear si el componente está montado
    let isMounted = true;
    const getMascota = async () => {
      try {
        const response = await axios.get(
          `http://localhost:8080/api/pacientes/${id}`,
          { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
        );
        // Verificamos si el componente está montado antes de actualizar el estado
        if (isMounted) {
          const fotoBase64 = btoa(
            new Uint8Array(mascotaData.foto).reduce(
              (data, byte) => data + String.fromCharCode(byte),
              ""
            )
          );
          // Construir la URL de datos de la imagen
          mascotaData.foto = `data:image/jpeg;base64,${fotoBase64}`;
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
      style={{ minHeight: "100vh", alignItems: "center", marginTop: "30px" }}
    >
      <Grid
        container
        spacing={3}
        justifyContent={"center"}
        alignItems={"flex-start"}
        sx={{ minHeight: "100vh" }}
      >
        {/* Información a la izquierda (12 columnas en dispositivos móviles, 6 en pantallas más grandes) */}
        <Grid item xs={12} sm={6}>
          {/* Contenedor para la información */}
          {/* Campos que muestran información uno debajo del otro */}
          <Box
            sx={{
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
              justifyContent: "flex-start",
            }}
          >
            {/* Botón para regresar */}
            <Actualizar paciente={mascotaData} />
            <IconButton onClick={() => navigate(-1)}>
              <ArrowBackIosNewIcon />
            </IconButton>
          </Box>
          {/* Agrega más campos según sea necesario */}
        </Grid>
      </Grid>
      {openError && <AlertaError />}
    </Container>
  );
};

export default ActualizarPaciente;
