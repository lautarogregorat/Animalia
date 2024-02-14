import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";
import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import { useNavigate } from "react-router-dom";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import { format } from "date-fns";
import Box from "@mui/material/Box";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import SimpleBackdrop from "../SimpleBackdrop";
import SkeletonConsultaActualizar from "../Skeletons/SkeletonConsultaActualizar";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const ConsultasActualizar = () => {
  const [data, setData] = useState({ titulo: null, descripcion: null });
  const [titulo, setTitulo] = useState("");
  const [descripcion, setDescripcion] = useState("");
  const [pdfLink, setLinkpdf] = useState("");
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const idPaciente = queryParams.get("idPaciente");
  const idConsulta = queryParams.get("idConsulta");
  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);
  const [loading, setLoading] = useState(false);
  const authContext = useAuth();
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);
  //Estado para el error
  const [openError, setOpenError] = useState(false);

  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(
          "http://animaliaveterinaria:8080/api/consultas",
          {
            headers: { Authorization: `Bearer ${authContext.keycloak.token}` },
            params: { idConsulta, idPaciente },
          }
        );

        setData(response.data);
        setTitulo(response.data.titulo);
        setDescripcion(response.data.descripcion);
        setLinkpdf(response.data.pdfLink);
        setLoading(true);

      } catch (error) {
        //console.error(error);
      }
    };
    getData();
  }, [idConsulta, idPaciente]);
  // Manejar el envío del formulario

  const handleSubmit = async (event) => {
    event.preventDefault();

    // Si hay errores, no enviar el formulario
    setOpenConfirm(true);
  };

  const navigate = useNavigate();

  const handleConfirm = async () => {
    setOpenConfirm(false);
    setOpenBackdrop(true);

    try {
      // Obtener la fecha y hora actual
      const currentDate = new Date();
      // Formatear la fecha
      const formattedDate = format(currentDate, "yyyy/MM/dd HH:mm:ss");

      const response = await axios.put(
        `http://animaliaveterinaria:8080/api/consultas/actualizar?idPaciente=${idPaciente}&idConsulta=${idConsulta}`,
        { titulo, descripcion, pdfLink, fechaModificacion: formattedDate },
        { headers: { Authorization: `Bearer ${authContext.keycloak.token}` } }
      );
      if (response.status === 200) {
        setOpenBackdrop(false);
        // Actualiza el estado si es necesario
        setData(response.data);
        setOpenSuccess(true);
      }
    } catch (error) {
      //console.error(error);
      setOpenBackdrop(false);
      setOpenError(true);
    }
  };

  return loading ? (
    <Container
      sx={{
        marginTop: "5rem",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        minWidth: "70%",
      }}
    >
      <AppBar
        position="static"
        mb={4}
        style={{
          backgroundColor: "#ffffff",
          height: "50px",
          borderBottom: "none",
          boxShadow: "none",
        }}
      >
        <Toolbar
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <IconButton
            edge="start"
            color="black"
            aria-label="back"
            onClick={() => navigate(-1)}
          >
            <ArrowBackIosNewIcon />
          </IconButton>
          <Typography
            variant="h6"
            component="div"
            color="black"
            sx={{ flexGrow: 1, textAlign: "center" }}
          >
            Actualizar Ficha
          </Typography>
        </Toolbar>
      </AppBar>
      <Paper elevation={0} style={{ padding: "20px", minWidth: "100%" }}>
        <Grid
          container
          direction="column"
          justifyContent="center"
          alignItems="center"
        >
          <Grid
            item
            xs={12}
            sm={6}
            minWidth={"100%"}
            alignItems="center"
            justifyContent="center"
          >
            <>
              <form onSubmit={handleSubmit}>
                <TextField
                  id="titulo"
                  label="Título"
                  name="titulo"
                  fullWidth
                  value={titulo}
                  onChange={(e) => setTitulo(e.target.value)}
                  sx={{ marginBottom: "16px" }}
                />
                <TextField
                  id="descripcion"
                  label="Descripción"
                  name="descripcion"
                  multiline
                  minRows={15}
                  maxRows={20}
                  fullWidth
                  value={descripcion}
                  onChange={(e) => setDescripcion(e.target.value)}
                  sx={{ marginBottom: "16px" }}
                />
                <TextField
                  id="pdfLink"
                  label="Estudio"
                  name="pdfLink"
                  multiline
                  fullWidth
                  value={pdfLink}
                  onChange={(e) => setLinkpdf(e.target.value)}
                />
                <Box align="center">
                  <Button
                    variant="contained"
                    align="center"
                    type="submit"
                    sx={{
                      backgroundColor: "#dda15e",
                      marginTop: "16px",
                      "&:hover": {
                        backgroundColor: "#D09F5C",
                        mb: "1", // Cambia este color al deseado
                      },
                    }}
                  >
                    Actualizar
                  </Button>
                </Box>
                <SimpleBackdrop open={openBackdrop} />
              </form>
            </>
          </Grid>
        </Grid>
      </Paper>
      <Dialog
        open={openConfirm}
        onClose={() => setOpenConfirm(false)}
        aria-labelledby="confirm-dialog"
      >
        <DialogTitle id="confirm-dialog">Confirmar Actualizacion</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-dialog-description">
            ¿Está seguro que quiere actualizar la ficha?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpenConfirm(false)} color="primary">
            No
          </Button>
          <Button onClick={handleConfirm} color="primary" autoFocus>
            Sí
          </Button>
        </DialogActions>
      </Dialog>
      <Dialog open={openSuccess} onClose={() => setOpenSuccess(false)}>
        <DialogTitle id="success-dialog">Registro Exitoso</DialogTitle>
        <DialogContent>
          <DialogContentText id="success-dialog-description">
            La ficha se actualizo exitosamente.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenSuccess(false);
              navigate(`/pacientes/${idPaciente}`);
            }}
            color="primary"
          >
            Ok
          </Button>
        </DialogActions>
      </Dialog>
      {openError && <AlertaError />}
    </Container>
  ) : (
    <SkeletonConsultaActualizar />
  );
};

export default ConsultasActualizar;
