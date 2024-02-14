import * as React from "react";
import Grid from "@mui/material/Grid";
import FullScreenImage from "../FullScreenImage"; // Asegúrate de importar el componente correctamente
import { useNavigate } from "react-router-dom";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import { useLocation } from "react-router-dom";
import axios from "axios";
import { useEffect, useState } from "react";
import SkeletonImgConsulta from "../Skeletons/SkeletonImgConsulta";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const VerImagenConsulta = () => {
  const authContext = useAuth();
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const idPaciente = queryParams.get("idPaciente");
  const idConsulta = queryParams.get("idConsulta");
  const navigate = useNavigate();
  const [consulta, setConsulta] = useState({});
  const [loading, setLoading] = useState(false);
  const [openError, setOpenError] = useState(false);

  useEffect(() => {
    // Utilizamos una variable para rastrear si el componente está montado
    let isMounted = true;
    const getConsulta = async () => {
      try {
        const response = await axios.get(
          "http://animaliaveterinaria.com.ar:8080/api/consultas/imagenes",
          {
            headers: { Authorization: `Bearer ${authContext.keycloak.token}` },
            params: { idConsulta, idPaciente },
          }
        );
        // Verificamos si el componente está montado antes de actualizar el estado
        if (isMounted) {
          // Construir la URL de datos de la imagen
          //mascotaData.foto = `data:image/jpeg;base64,${response.data.foto}`;
          if (response.status === 200) {
            setConsulta(response.data);
            setLoading(true);
          }
        }
      } catch (error) {
        //console.error(error);
        setOpenError(true);
      }
    };

    getConsulta();

    // Función de limpieza para indicar que el componente se ha desmontado
    return () => {
      isMounted = false;
    };
  }, []);

  return loading ? (
    <Grid
      container
      direction="row"
      justifyContent="center"
      alignItems="center"
      p={10}
      spacing={{ xs: 2, md: 3 }}
    >
      <IconButton
        onClick={() =>
          navigate(
            `/pacientes/fichas?idPaciente=${idPaciente}&idConsulta=${idConsulta}`
          )
        }
      >
        <ArrowBackIosNewIcon />
      </IconButton>
      <Grid item xs={12} sm={6} md={4}>
        <FullScreenImage src={consulta.foto} />
      </Grid>
      <Grid item xs={12} sm={6} md={4}>
        <FullScreenImage src={consulta.foto2} />
      </Grid>
      {openError && <AlertaError />}
    </Grid>
  ) : (
    <SkeletonImgConsulta />
  );
};

export default VerImagenConsulta;
