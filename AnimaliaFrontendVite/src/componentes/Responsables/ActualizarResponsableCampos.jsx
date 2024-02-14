import React, { useEffect } from "react";
import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import TextField from "@mui/material/TextField";
import MultipleSelect from "../MultipleSelector";
import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import SimpleBackdrop from "../SimpleBackdrop";
import ValidaciónResponsable from "../Errores/ValidacionResponsable";
import { useAuth } from "../../context/AuthContext";

const ActualizarResponsableCampos = ({ responsable, idPaciente }) => {
  const navigate = useNavigate();
  const authContext = useAuth();
  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);
  const [
    mostrarCamposResponsable,
    setMostrarCamposResponsable,
  ] = React.useState(false);
  const [
    mostrarCamposNohayResponsable,
    setMostrarCamposNohayResponsable,
  ] = React.useState(true);
  const [multipleSelectKey, setMultipleSelectKey] = React.useState(0);
  // Estado para validar si se selecciono un responsable
  const [isResponsableSelected, setIsResponsableSelected] = useState(false);

  // Estado para mostrar el error de seleccionar un responsable
  const [openValidacionResponsable, setOpenValidacionResponsable] = useState(
    false
  );
  const [formData, setFormData] = React.useState({
    idResponsable: 0,
    nombre: "",
    apellido: "",
    email: "",
    telefono: "",
    existe: "0",
    idResponsableNuevo: 0,
  });

  useEffect(() => {
    setFormData({
      idResponsable: responsable.id,
      nombre: responsable.nombre,
      apellido: responsable.apellido,
      email: responsable.email,
      telefono: responsable.telefono,
      existe: "0",
      idResponsableNuevo: 0,
    });
    setIsResponsableSelected(true);
  }, [responsable]);

  // Estado para almacenar los errores de validación
  const [formErrors, setFormErrors] = useState({});
  const [idRedireccion, setIdRedireccion] = useState(idPaciente);
  //Modal
  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);

  const handleResponsableButtonClick = (noHayResponsable) => {
    setFormData({
      ...formData,
      idResponsable: responsable.id,
      nombre: responsable.nombre,
      apellido: responsable.apellido,
      email: responsable.email,
      telefono: responsable.telefono,
      existe: "0",
      idResponsableNuevo: 0,
    });
    setMostrarCamposResponsable(noHayResponsable);
    setMostrarCamposNohayResponsable(!noHayResponsable);
    setIsResponsableSelected(true);
    // Resetear los errores
    setFormErrors({});
  };
  const handleDeselectResponsable = () => {
    setFormData({
      ...formData,
      responsableId: 0,
      nombreResponsable: "",
      apellidoResponsable: "",
      emailResponsable: "",
      telefonoResponsable: "",
    });
    setIsResponsableSelected(false);
  };

  const handleResponsableChange = (responsable) => {
    setFormData({
      ...formData,
      nombre: responsable.nombre,
      apellido: responsable.apellido,
      email: responsable.email,
      telefono: responsable.telefono,
      existe: "1",
      idResponsableNuevo: responsable.id,
    });
    setIsResponsableSelected(true);
  };

  // Manejar cambios en los campos del formulario
  const handleInputChange = (event) => {
    const { name, value } = event.target;

    let errors = { ...formErrors };

    if (
      mostrarCamposNohayResponsable &&
      name === "nombreResponsable" &&
      value.trim() === ""
    ) {
      // Validación para el campo "Nombre" cuando se elige la opción "No hay responsable"
      errors.nombre = 'El campo "Nombre" no puede estar vacío';
    } else if (name === "telefonoResponsable" && !/^\d*$/.test(value)) {
      // Validación para el campo "Teléfono"
      errors.telefono = 'El campo "Teléfono" solo puede contener números';
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

    if (formData.nombre.trim() === "" && mostrarCamposNohayResponsable) {
      errors.nombre = 'El campo "Nombre" no puede estar vacío';
    }

    if (!isResponsableSelected) {
      setOpenValidacionResponsable(true);
      return;
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
      // Crear un nuevo objeto formData con la fecha formateada
      const formattedFormData = {
        ...formData,
        telefono: Number(formData.telefono),
      };
      // Enviar datos a la API
      const response = await axios.put(
        `http://animaliaveterinaria.com.ar:8080/api/pacientes/actualizarResponsable/${idPaciente}`,
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
        setOpenSuccess(true);
        setFormData({
          idResponsable: 0,
          nombre: "",
          apellido: "",
          email: "",
          telefono: "",
          existe: "0",
          idResponsableNuevo: 0,
        });
        setMultipleSelectKey(Date.now());
      } else {
        console.error("Error al enviar datos a la API");
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
    }
  };

  const handleCloseValidation = () => {
    setOpenValidacionResponsable(false);
  };

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
            <Divider />
            <Grid item xs={12}>
              <Typography variant="h6" gutterBottom>
                Actualizar Datos del Responsable
              </Typography>
              <Button
                onClick={() => handleResponsableButtonClick(true)}
                sx={{
                  transition: "transform 0.2s ease-in-out",
                  "&:hover": {
                    transform: "scale(1.1)",
                    transition: "transform 0.3s ease-in-out",
                  },
                }}
              >
                <Typography variant="text" sx={{ color: "#47351d" }}>
                  Seleccionar uno nuevo
                </Typography>
              </Button>
              <Button
                onClick={() => handleResponsableButtonClick(false)}
                sx={{
                  transition: "transform 0.2s ease-in-out",
                  "&:hover": {
                    transform: "scale(1.1)",
                    transition: "transform 0.3s ease-in-out",
                  },
                }}
              >
                <Typography variant="text" sx={{ color: "#47351d" }}>
                  Modificar el actual
                </Typography>
              </Button>
            </Grid>
            {mostrarCamposResponsable && (
              <>
                <Grid item xs={12}>
                  <MultipleSelect
                    onResponsableChange={handleResponsableChange}
                    key={multipleSelectKey}
                    onDeselectResponsable={handleDeselectResponsable}
                  />
                </Grid>
                {/* Agrega los demás campos del responsable según tus necesidades */}
              </>
            )}
            {mostrarCamposNohayResponsable && (
              <>
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
                    label="Apellido"
                    variant="outlined"
                    fullWidth
                    name="apellido"
                    value={formData.apellido}
                    onChange={handleInputChange}
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    label="Email"
                    variant="outlined"
                    fullWidth
                    name="email"
                    value={formData.email}
                    onChange={handleInputChange}
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    label="Telefono"
                    variant="outlined"
                    fullWidth
                    name="telefono"
                    value={formData.telefono}
                    onChange={handleInputChange}
                    error={!!formErrors.telefono}
                    helperText={formErrors.telefono}
                  />
                </Grid>
              </>
            )}
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
        <DialogTitle id="confirm-dialog">Confirmar Registro</DialogTitle>
        <DialogContent>
          <DialogContentText id="confirm-dialog-description">
            ¿Está seguro que quiere confirmar el registro?
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
            El cliente se registró exitosamente.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={() => {
              setOpenSuccess(false);
              navigate(`/pacientes/${idRedireccion}`);
            }}
            color="primary"
          >
            Ok
          </Button>
        </DialogActions>
      </Dialog>
      {openValidacionResponsable && (
        <ValidaciónResponsable onClose={handleCloseValidation} />
      )}
    </Container>
  );
};

export default ActualizarResponsableCampos;
