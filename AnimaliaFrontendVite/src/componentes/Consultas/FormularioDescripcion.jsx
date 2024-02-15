import React, { useState } from "react";
import Container from "@mui/material/Container";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import axios from "axios";
import Dialog from "@mui/material/Dialog";
import DialogTitle from "@mui/material/DialogTitle";
import DialogContent from "@mui/material/DialogContent";
import DialogActions from "@mui/material/DialogActions";
import DialogContentText from "@mui/material/DialogContentText";
import { useParams } from "react-router-dom";
import format from "date-fns/format";
import { useNavigate } from "react-router-dom";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import SimpleBackdrop from "../SimpleBackdrop";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const FormularioDescripcion = () => {
  const authContext = useAuth();
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);
  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);
  const { id } = useParams();
  const navigate = useNavigate();
  const [idConsulta, setIdConsulta] = useState("");
  // Estados para almacenar los datos del formulario
  const [formData, setFormData] = useState({
    descripcion: "",
    titulo: "",
    fecha: "",
    pdflink: "",
  });
  // Estado para el error
  const [openError, setOpenError] = useState(false);
  const [formErrors, setFormErrors] = useState({});

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    let errors = { ...formErrors };

    if (name === "titulo" && value.trim() === "") {
      errors.titulo = "El título es requerido";
    } else {
      errors[name] = "";
    }
    setFormErrors(errors);

    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleFormSubmit = (e) => {
    e.preventDefault();
    let errors = { ...formErrors };
    if (formData.titulo.trim() === "") {
      errors.titulo = "El título es requerido";
    }

    setFormErrors(errors);
    // Si hay errores, no enviar el formulario
    if (Object.values(errors).some((error) => error !== "")) {
      return;
    }

    setOpenConfirm(true);
  };

  const handleConfirm = async () => {
    setOpenConfirm(false);
    setOpenBackdrop(true);
    // Obtener la fecha y hora actual
    const currentDate = new Date();

    // Formatear la fecha
    const formattedDate = format(currentDate, "yyyy/MM/dd HH:mm:ss");
    const formattedFormData = {
      ...formData,
      fecha: formattedDate,
    };

    // Aquí va el código para enviar los datos
    try {

      // Enviar datos a la API
      const response = await axios.post(
        `http://animaliaveterinaria.com.ar:8080/api/consultas/registrar/${id}`,
        formattedFormData,
        {
          headers: {
            Authorization: `Bearer ${authContext.keycloak.token}`,
            "Content-Type": "application/json",
          },
        }
      );

      // Manejar la respuesta de la API
      if (response.status === 200) {
        setOpenBackdrop(false);
        setIdConsulta(response.data.id);
        // Si todo sale bien, abre el diálogo de éxito
        //console.log("Datos enviados correctamente", response.data);
        setOpenSuccess(true);
        setFormData({
          descripcion: "",
          titulo: "",
          fecha: "",
          pdflink: "",
        });
      } else {
        //console.error("Error al enviar datos a la API");
      }
    } catch (error) {
      //console.error("Error en la solicitud:", error);
      setOpenBackdrop(false);
      setOpenError(true);
    }
  };
  return (
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
            Registrar Ficha
          </Typography>
        </Toolbar>
      </AppBar>
      <Paper elevation={0} style={{ padding: "20px", minWidth: "100%" }}>
        <form onSubmit={handleFormSubmit}>
          <Grid
            container
            direction="column"
            justifyContent="center"
            alignItems="center"
          >
            <TextField
              id="titulo"
              label="Titulo"
              name="titulo"
              fullWidth
              value={formData.titulo}
              onChange={handleInputChange}
              error={!!formErrors.titulo}
              helperText={formErrors.titulo}
              sx={{ marginBottom: "16px" }}
            />
            <TextField
              id="descripcion"
              label="Descripcion"
              name="descripcion"
              multiline
              minRows={15}
              maxRows={20}
              fullWidth
              value={formData.descripcion}
              onChange={handleInputChange}
              sx={{ marginBottom: "16px" }}
            />
            <TextField
              id="pdflink"
              label="Estudio"
              name="pdflink"
              multiline
              fullWidth
              value={formData.pdflink}
              onChange={handleInputChange}
            />
          </Grid>
          <Grid
            container
            direction="column"
            justifyContent="center"
            alignItems="center"
          >
            <Button
              type="submit"
              variant="contained"
              sx={{
                backgroundColor: "#dda15e",
                marginTop: "16px",
                "&:hover": {
                  backgroundColor: "#D09F5C", // Cambia este color al deseado
                },
              }}
            >
              Registrar
            </Button>
            <SimpleBackdrop open={openBackdrop} />
          </Grid>
        </form>
      </Paper>
      <Dialog
        open={openConfirm}
        onClose={() => setOpenConfirm(false)}
        aria-labelledby="confirm-dialog"
      >
        <DialogTitle id="confirm-dialog">Confirmar Ficha</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-dialog-description">
            ¿Está seguro que quiere confirmar la ficha?
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
            La ficha se registró exitosamente.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenSuccess(false);
              navigate(
                `/pacientes/fichas?idPaciente=${id}&idConsulta=${idConsulta}`
              );
            }}
            color="primary"
          >
            Ok
          </Button>
        </DialogActions>
      </Dialog>
      {openError && <AlertaError />}
    </Container>
  );
};

export default FormularioDescripcion;
