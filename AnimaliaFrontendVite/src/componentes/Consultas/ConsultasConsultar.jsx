import React, { useEffect } from "react";
import axios from "axios";
import { useLocation } from "react-router-dom";
import Container from "@mui/material/Container";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import Typography from "@mui/material/Typography";
import { format } from "date-fns";
import Box from "@mui/material/Box";
import BotonVerImgConsulta from "../Botones/BotonVerImgConsulta";
import { useNavigate } from "react-router-dom";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import ButtonGroup from "@mui/material/ButtonGroup";
import BotonSubirImgConsulta from "../Botones/BotonSubirImgConsulta";
import Skeleton from "@mui/material/Skeleton";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const ConsultasConsultar = () => {
  const [data, setData] = React.useState([]);
  const [openError, setOpenError] = React.useState(false);
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const idPaciente = queryParams.get("idPaciente");
  const idConsulta = queryParams.get("idConsulta");
  const navigate = useNavigate();
  const authContext = useAuth();

  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8080/api/consultas",
          {
            headers: { Authorization: `Bearer ${authContext.keycloak.token}` },
            params: { idConsulta, idPaciente },
          }
        );
        setData(response.data);
      } catch (error) {
        //console.error(error);
        setOpenError(true);
      }
    };
    getData();
  }, []);

  const formatDate = (dateString) => {
    if (dateString != undefined) {
      const formattedDate = format(new Date(dateString), "dd/MM/yyyy HH:mm:ss");
      return formattedDate;
    }
    return 0;
  };

  return (
    <Container
      sx={{
        marginTop: "5rem",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        minWidth: "70%",
        minHeight: "100vh",
      }}
    >
      <Paper elevation={3} style={{ padding: "20px", minWidth: "100%" }}>
        <Grid
          container
          direction="row"
          justifyContent="flex-start"
          alignItems="center"
        >
          <Grid item xs={1} mb={2}>
            <IconButton
              onClick={() => navigate("/pacientes/" + idPaciente + "")}
            >
              <ArrowBackIosNewIcon />
            </IconButton>
          </Grid>
          <Grid item xs={10} mb={2}>
            <Typography variant="h5" align="center" gutterBottom>
              Ficha
            </Typography>
          </Grid>
          {data ? (
            <>
              <Box
                border={1}
                borderColor="grey.300"
                borderRadius={2}
                p={2}
                mb={2}
                width="100%"
              >
                <Typography
                  variant="subtitle1"
                  align="left"
                  gutterBottom
                  fontWeight="bold"
                >
                  Título
                </Typography>
                <Typography variant="body1" align="left" gutterBottom>
                  {data.titulo ? (
                    data.titulo
                  ) : (
                    <Skeleton variant="text" width={210} />
                  )}
                </Typography>
              </Box>
              <Box
                border={1}
                borderColor="grey.300"
                borderRadius={2}
                p={2}
                mb={2}
                width="100%"
              >
                <Typography
                  variant="subtitle1"
                  align="left"
                  gutterBottom
                  fontWeight="bold"
                >
                  Descripción
                </Typography>
                <Typography
                  variant="body1"
                  align="left"
                  sx={{ whiteSpace: "pre-line" }}
                >
                  {data.titulo ? (
                    data.descripcion
                  ) : (
                    <Skeleton variant="text" width={210} />
                  )}
                </Typography>
              </Box>
              <Box
                border={1}
                borderColor="grey.300"
                borderRadius={2}
                p={2}
                mb={2}
                width="100%"
              >
                <Typography
                  variant="subtitle1"
                  align="left"
                  gutterBottom
                  fontWeight="bold"
                >
                  Estudio
                </Typography>
                <Typography
                  variant="body1"
                  align="left"
                  sx={{ whiteSpace: "pre-line" }}
                >
                  {data.titulo ? (
                    data.pdfLink
                  ) : (
                    <Skeleton variant="text" width={210} />
                  )}
                </Typography>
              </Box>
              <Box
                border={1}
                borderColor="grey.300"
                borderRadius={2}
                p={2}
                mb={2}
                width="100%"
              >
                <Typography
                  variant="subtitle1"
                  align="left"
                  gutterBottom
                  fontWeight="bold"
                >
                  Ultima Fecha de Modificacion
                </Typography>
                <Typography
                  variant="body1"
                  align="left"
                  sx={{ whiteSpace: "pre-line" }}
                >
                  {formatDate(data.fechaModificacion) ? (
                    formatDate(data.fechaModificacion)
                  ) : (
                    <Skeleton variant="text" width={210} />
                  )}
                </Typography>
              </Box>
              <Box
                border={1}
                borderColor="grey.300"
                borderRadius={2}
                p={2}
                width="100%"
              >
                <ButtonGroup
                  size="small"
                  variant="text"
                  color="secondary"
                  aria-label="large button group"
                >
                  <BotonVerImgConsulta
                    idConsulta={idConsulta}
                    idPaciente={idPaciente}
                  />
                  <BotonSubirImgConsulta
                    idConsulta={idConsulta}
                    idPaciente={idPaciente}
                  />
                </ButtonGroup>
              </Box>
            </>
          ) : (
            <Typography variant="body1">Cargando...</Typography>
          )}
        </Grid>
      </Paper>
      {openError && <AlertaError />}
    </Container>
  );
};

export default ConsultasConsultar;
