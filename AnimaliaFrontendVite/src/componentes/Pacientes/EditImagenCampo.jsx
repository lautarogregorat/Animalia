import React, { useState } from "react";
import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import axios from "axios";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import VisuallyHiddenInput from "../VisuallyHiddenInput";
import SimpleBackdrop from "../SimpleBackdrop";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const EditImagenCampo = ({ paciente }) => {

  const [selectedFile, setSelectedFile] = React.useState(null);
  const authContext = useAuth();
  // Estados para almacenar los datos del formulario
  const [formData, setFormData] = useState({
    foto: selectedFile || "",
  });

  // Estado para el error
  const [openError, setOpenError] = useState(false);

  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);

  const getBase64 = (file) => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result);
      reader.onerror = (error) => reject(error);
    });
  };

  // Usar useEffect para establecer formData una vez que el paciente esté disponible
  useEffect(() => {
    setFormData({
      foto: selectedFile || "",
    });
  }, [paciente]);

  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);

  // Manejar el envío del formulario
  const handleSubmit = async (event) => {
    event.preventDefault();
    setOpenConfirm(true);
  };
  const handleConfirm = async () => {
    setOpenConfirm(false);
    setOpenBackdrop(true);

    // Aquí va el código para enviar los datos
    //
    try {
      // Crear un nuevo objeto formData con la fecha formateada
      const formattedFormData = {
        ...formData,
        foto: selectedFile ? await getBase64(selectedFile) : null,
      };
      // Enviar datos a la API
      const response = await axios.put(
        `http://localhost:8080/api/pacientes/editImagen/${paciente.idPaciente}`,
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
        // Si todo sale bien, abre el diálogo de éxito
        //console.log("Datos enviados correctamente", response.data);
        setOpenSuccess(true);
        setFormData({
          foto: "",
        });
      } else {
        console.error("Error al enviar datos a la API");
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
      setOpenBackdrop(false);
      setOpenError(true);
    }
  };
  const navigate = useNavigate();

  return (
    <Container maxWidth="sm" sx={{ textAlign: "center", marginTop: "70px" }}>
      <Paper
        elevation={3}
        sx={{
          backgroundColor: "white",
          boxShadow: "0px 0px 10px 0px rgba(0, 0, 0, 0.1)",
          borderRadius: "8px",
          padding: "20px",
        }}
      >
        <form onSubmit={handleSubmit}>
          <Grid container spacing={2}>
            <Grid item xs={12}>
              <Typography variant="h6" gutterBottom>
                Actualizar Imagen
              </Typography>
              <Divider />
            </Grid>
            <Grid item xs={12}>
              <VisuallyHiddenInput setSelectedFile={setSelectedFile} />
            </Grid>
          </Grid>
          <Button
            type="submit"
            variant="contained"
            sx={{
              marginTop: "16px",
              backgroundColor: "#6fbe56",
              "&:hover": {
                backgroundColor: "#6fbe56",
                filter: "brightness(1.1)",
              },
            }}
          >
            Ok
          </Button>
          <SimpleBackdrop open={openBackdrop} />
        </form>
      </Paper>
      <Dialog
        open={openConfirm}
        onClose={() => setOpenConfirm(false)}
        aria-labelledby="confirm-dialog"
      >
        <DialogTitle id="confirm-dialog">Confirmar Actualizacion</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-dialog-description">
            ¿Está seguro que quiere actualizar el paciente?
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
            El cliente se actualizo exitosamente.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenSuccess(false);
              navigate(`/pacientes/${paciente.idPaciente}`);
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

export default EditImagenCampo;
