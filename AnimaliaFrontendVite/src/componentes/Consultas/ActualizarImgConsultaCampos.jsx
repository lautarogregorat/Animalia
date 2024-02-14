import React, { useState } from "react";
import { Button, Container, Divider, Typography } from "@mui/material";
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
import { useLocation } from "react-router-dom";
import { toByteArray } from "base64-js";
import SimpleBackdrop from "../SimpleBackdrop";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const ActualizarImgConsultaCampos = ({ consulta }) => {

  const authContext = useAuth();
  const [selectedFile, setSelectedFile] = React.useState(null);
  const [selectedFile2, setSelectedFile2] = React.useState(null);
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const idPaciente = queryParams.get("idPaciente");
  const idConsulta = queryParams.get("idConsulta");
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);
  // Estado para mostrar el errror
  const [openError, setOpenError] = useState(false);

  useEffect(() => {
    if (consulta && consulta.foto !== "") {
      //const base64Url = atob(`data:image/jpeg;base64${consulta.foto}`);
      const byteArray = toByteArray(consulta.foto);
      let blob = new Blob([byteArray], { type: "image/jpeg" });
      let file = new File([blob], "filename.jpg", { type: "image/jpeg" });
      setSelectedFile(file);
    }
    if (consulta && consulta.foto2 !== "") {
      //const base64Url2 = atob(`data:image/jpeg;base64${consulta.foto2}`);
      const byteArray2 = toByteArray(consulta.foto2);
      let blob2 = new Blob([byteArray2], { type: "image/jpeg" });
      let file2 = new File([blob2], "filename2.jpg", { type: "image/jpeg" });
      setSelectedFile2(file2);
    }
  }, []);

  // Estados para almacenar los datos del formulario
  const [formData, setFormData] = useState({
    foto: selectedFile || "",
    foto2: selectedFile2 || "",
  });

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
      foto2: selectedFile2 || "",
    });
  }, [consulta]);

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
        foto2: selectedFile2 ? await getBase64(selectedFile2) : null,
      };

      /*console.log(
        "Datos a enviar:",
        JSON.stringify(formattedFormData, null, 2)
      );*/
      // Enviar datos a la API
      const response = await axios.put(
        `http://animaliaveterinaria.com.ar:8080/api/consultas/actualizarFoto?idPaciente=${idPaciente}&idConsulta=${idConsulta}`,
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
        setOpenSuccess(true);
        setFormData({
          foto: "",
          foto2: "",
        });
      } else {
        //console.error("Error al enviar datos a la API");
      }
    } catch (error) {
      // Si hay un error, abre el diálogo de error
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
                {selectedFile ? "Actualizar Imagen 1" : "Subir Imagen 1"}
              </Typography>
              <Divider />
            </Grid>
            <Grid item xs={12}>
              <VisuallyHiddenInput
                setSelectedFile={setSelectedFile}
                showUpdateText={!!selectedFile}
              />
            </Grid>
            <Grid item xs={12}>
              <Typography variant="h6" gutterBottom>
                {selectedFile2 ? "Actualizar Imagen 2" : "Subir Imagen 2"}
              </Typography>
              <Divider />
            </Grid>
            <Grid item xs={12} mb={2}>
              <VisuallyHiddenInput
                setSelectedFile={setSelectedFile2}
                showUpdateText={!!selectedFile2}
              />
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
              navigate(
                `/pacientes/consultas/Ver/Imagen?idPaciente=${idPaciente}&idConsulta=${idConsulta} `
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

export default ActualizarImgConsultaCampos;
