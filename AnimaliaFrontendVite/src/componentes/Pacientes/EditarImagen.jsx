import React, { useState, useEffect } from "react";
import axios from "axios";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import { useParams } from "react-router-dom";
import EditImagenCampo from "./EditImagenCampo";
import { useNavigate } from "react-router-dom";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const EditarImagen = () => {
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
        //console.log("Respuesta del servidor EDIT IMAGEN:", response);
        // Verificamos si el componente está montado antes de actualizar el estado
        if (isMounted) {
          // Construir la URL de datos de la imagen
          //mascotaData.foto = `data:image/jpeg;base64,${response.data.foto}`;
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
        <Grid item xs={12} sm={6}>
          {/* Botón para regresar */}
          {/* Componente EditarImagenCampo */}
          <Box
            sx={{
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
              justifyContent: "flex-start",
            }}
          >
            {/* Botón para regresar */}
            {/* Componente EditarImagenCampo */}
            <EditImagenCampo paciente={mascotaData} />
            <IconButton onClick={() => navigate(-1)}>
              <ArrowBackIosNewIcon />
            </IconButton>
          </Box>
        </Grid>
      </Grid>
      {openError && <AlertaError />}
    </Container>
  );
};

export default EditarImagen;
