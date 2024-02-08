import React, { useState } from "react";
import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import InputLabel from "@mui/material/InputLabel";
import Select from "@mui/material/Select";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { format } from "date-fns";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import axios from "axios";
import FormHelperText from "@mui/material/FormHelperText";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import SimpleBackdrop from "../SimpleBackdrop";
import SkeletonActualizar from "../Skeletons/SkeletonActualizar";
import AlertaError from "../Errores/AlertaError";
import { useAuth } from "../../context/AuthContext";

const Actualizar = ({ paciente }) => {
  const authContext = useAuth();
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);

  // Estados para almacenar los datos del formulario
  const [formData, setFormData] = useState({
    nombre: "",
    raza: "",
    especie: "",
    sexo: "",
    fechaNacimiento: "date",
    esterilizado: "",
    descripcion: "",
    foto: "",
  });

  // Estado para el error
  const [openError, setOpenError] = useState(false);

  // Usar useEffect para establecer formData una vez que el paciente esté disponible
  useEffect(() => {
    const fechaNacimiento = new Date(paciente.fechaNacimiento);
    fechaNacimiento.setDate(fechaNacimiento.getDate() + 1);

    // Crear un nuevo objeto Date a partir del timestamp
    const fechaModificada = new Date(fechaNacimiento);

    // Formatear la fecha en el formato yyyy-mm-dd
    const fechaFormateada = `${fechaModificada.getFullYear()}-${(
      "0" +
      (fechaModificada.getMonth() + 1)
    ).slice(-2)}-${("0" + fechaModificada.getDate()).slice(-2)}`;
    setFormData({
      nombre: paciente.nombre || "",
      raza: paciente.raza || "",
      especie: paciente.especie || "",
      sexo: paciente.sexo || "",
      fechaNacimiento: fechaFormateada || "date",
      esterilizado: paciente.esterilizado || 0,
      descripcion: paciente.descripcion || "",
      foto: paciente.foto || "",
    });
  }, [paciente]);

  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);

  // Estado para almacenar los errores de validación
  const [formErrors, setFormErrors] = useState({});
  // Manejar cambios en los campos del formulario
  const handleInputChange = (event) => {
    const { name, value } = event.target;
    let errors = { ...formErrors };

    // Validación para el campo "Nombre"
    if (name === "nombre" && value.trim() === "") {
      errors.nombre = 'El campo "Nombre" no puede estar vacío';
    } else if (name === "esterilizado" && value === "") {
      // Validación para el campo "Esterilizado"
      errors.esterilizado = 'Debe seleccionar una opción en "Esterilizado"';
    } else {
      errors[name] = "";
    }

    setFormErrors(errors);

    setFormData({
      ...formData,
      [name]: value,
    });
  };

  // Manejar el envío del formulario
  const handleSubmit = async (event) => {
    event.preventDefault();

    let errors = { ...formErrors };

    // Verificar si el campo "Nombre" está vacío
    if (formData.nombre.trim() === "") {
      errors.nombre = 'El campo "Nombre" no puede estar vacío';
    }
    // Verficar si el campo Esterilizado esta vacio
    if (formData.esterilizado === "") {
      errors.esterilizado = 'Debe seleccionar una opción en "Esterilizado"';
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

    // Aquí va el código para enviar los datos
    //
    try {
      let formattedDate = "";

      // Formatear la fecha de nacimiento
      if (formData.fechaNacimiento === "NaN-aN-aN") {
        formattedDate = paciente.fechaNacimiento;
      } else {
        const date = new Date(formData.fechaNacimiento);
        date.setDate(date.getDate() + 1);
        formattedDate = format(date, "yyyy-MM-dd");
      }

      // Crear un nuevo objeto formData con la fecha formateada
      const formattedFormData = {
        ...formData,
        fechaNacimiento: formattedDate,
        esterilizado: Number(formData.esterilizado),
        peso: Number(formData.peso),
      };

      // Enviar datos a la API
      const response = await axios.put(
        `http://localhost:8080/api/pacientes/${paciente.idPaciente}`,
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

  return formData.nombre !== "" ? (
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
                Actualizar Paciente
              </Typography>
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Nombre"
                variant="outlined"
                fullWidth
                name="nombre"
                value={formData.nombre}
                onChange={handleInputChange}
                error={!!formErrors.nombre}
                helperText={formErrors.nombre}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Especie"
                variant="outlined"
                fullWidth
                name="especie"
                value={formData.especie}
                onChange={handleInputChange}
              />
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Raza"
                variant="outlined"
                fullWidth
                name="raza"
                value={formData.raza}
                onChange={handleInputChange}
              />
            </Grid>
            <Grid item xs={12} textAlign={"left"}>
              <FormControl variant="outlined" fullWidth>
                <InputLabel>Sexo</InputLabel>
                <Select
                  label="Sexo"
                  name="sexo"
                  value={formData.sexo}
                  onChange={handleInputChange}
                >
                  <MenuItem value="Macho">Macho</MenuItem>
                  <MenuItem value="Hembra">Hembra</MenuItem>
                  {/* Agrega más categorías según tus necesidades */}
                </Select>
              </FormControl>
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Fecha de Nacimiento"
                variant="outlined"
                type="date"
                fullWidth
                name="fechaNacimiento"
                value={formData.fechaNacimiento}
                onChange={handleInputChange}
                error={!!formErrors.fechaNacimiento}
                helperText={formErrors.fechaNacimiento}
              />
            </Grid>
            <Grid item xs={12} textAlign={"left"}>
              <FormControl variant="outlined" fullWidth>
                <InputLabel>Esterilizado</InputLabel>
                <Select
                  label="Esteriliado"
                  name="esterilizado"
                  value={formData.esterilizado}
                  onChange={handleInputChange}
                  error={!!formErrors.esterilizado}
                >
                  <MenuItem value="1">Si</MenuItem>
                  <MenuItem value="0">No</MenuItem>
                  {/* Agrega más categorías según tus necesidades */}
                </Select>
                <FormHelperText error={!!formErrors.esterilizado}>
                  {formErrors.esterilizado}
                </FormHelperText>
              </FormControl>
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Descripcion"
                variant="outlined"
                fullWidth
                name="descripcion"
                value={formData.descripcion}
                onChange={handleInputChange}
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
            fullWidth
          >
            Actualizar
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
  ) : (
    <SkeletonActualizar />
  );
};

export default Actualizar;
