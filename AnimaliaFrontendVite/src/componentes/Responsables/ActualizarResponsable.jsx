import React, { useState, useEffect } from "react";
import axios from "axios";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import { useNavigate } from "react-router-dom";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import ActualizarResponsableCampos from "./ActualizarResponsableCampos";
import { useLocation } from "react-router-dom";
import SkeletonResponsable from "../Skeletons/SkeletonResponsable";
import { useAuth } from "../../context/AuthContext";

const ActualizarResponsable = () => {
  const [responsable, setResponsable] = React.useState({});
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const idResponsable = queryParams.get("idResponsable");
  const idPaciente = queryParams.get("idPaciente");
  const [isLoading, setIsLoading] = useState(true);
  const authContext = useAuth();

  const navigate = useNavigate();

  useEffect(() => {
    // Utilizamos una variable para rastrear si el componente está montado
    let isMounted = true;
    const getConsulta = async () => {
      try {
        const response = await axios.get(
          `http://localhost:8080/api/responsables/${idResponsable}`,
          {
            headers: { Authorization: `Bearer ${authContext.keycloak.token}` },
          }
        );
        //console.log("Respuesta del servidor Responsable:", response);
        // Verificamos si el componente está montado antes de actualizar el estado
        if (isMounted) {
          // Construir la URL de datos de la imagen
          //mascotaData.foto = `data:image/jpeg;base64,${response.data.foto}`;
          setResponsable(response.data);
          setIsLoading(false);
        }
      } catch (error) {
        console.error(error);
      }
    };

    getConsulta();

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
            {isLoading ? (
              // Muestra el esqueleto mientras los datos están cargando
              <SkeletonResponsable />
            ) : (
              // Muestra el componente ActualizarResponsableCampos una vez que los datos se han cargado
              <ActualizarResponsableCampos
                responsable={responsable}
                idPaciente={idPaciente}
              />
            )}
            <IconButton onClick={() => navigate(-1)}>
              <ArrowBackIosNewIcon />
            </IconButton>
          </Box>
        </Grid>
      </Grid>
    </Container>
  );
};

export default ActualizarResponsable;
