import React, { useState } from "react";
import Container from "@mui/material/Container";
import Typography from "@mui/material/Typography";
import TextField from "@mui/material/TextField";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import InputLabel from "@mui/material/InputLabel";
import Select from "@mui/material/Select";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { format } from "date-fns";
import MultipleSelect from "../MultipleSelector";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogTitle from "@mui/material/DialogTitle";
import axios from "axios";
import FormHelperText from "@mui/material/FormHelperText";
import { useNavigate } from "react-router-dom";
import VisuallyHiddenInput from "../VisuallyHiddenInput";
import { addDays } from "date-fns";
import SimpleBackdrop from "../SimpleBackdrop";
import AlertaError from "../Errores/AlertaError";
import ValidaciónResponsable from "../Errores/ValidacionResponsable";
import { useAuth } from "../../context/AuthContext";

const RegistrarPaciente = () => {
  const authContext = useAuth();
  const navigate = useNavigate();
  // Estados para almacenar los datos del formulario
  const [formData, setFormData] = useState({
    nombre: "",
    peso: "",
    sexo: "",
    fechaNacimiento: "date",
    esterilizado: "",
    descripcion: "",
    responsableId: 0,
    nombreResponsable: "",
    apellidoResponsable: "",
    emailResponsable: "",
    telefonoResponsable: "",
    foto: "string",
  });
  const [selectedFile, setSelectedFile] = React.useState(null);
  const [openConfirm, setOpenConfirm] = React.useState(false);
  const [openSuccess, setOpenSuccess] = React.useState(false);
  const [mostrarCamposResponsable, setMostrarCamposResponsable] = useState(false);
  const [multipleSelectKey, setMultipleSelectKey] = useState(Date.now());
  const [mostrarCamposNohayResponsable, setMostrarCamposNohayResponsable] = useState(false);

  // Estado para almacenar los errores de validación
  const [formErrors, setFormErrors] = useState({});
  const [idRedireccion, setIdRedireccion] = useState(null);

  // Estado para el backdrop
  const [openBackdrop, setOpenBackdrop] = useState(false);

  // Estado para mostrar error
  const [openError, setOpenError] = useState(false);

  // Estado para validar si se selecciono un responsable
  const [isResponsableSelected, setIsResponsableSelected] = useState(false);

  // Estado para mostrar el error de seleccionar un responsable
  const [openValidacionResponsable, setOpenValidacionResponsable] = useState(false);

  const handleResponsableButtonClick = (noHayResponsable) => {
    setFormData({
      ...formData,
      nombreResponsable: "",
      apellidoResponsable: "",
      emailResponsable: "",
      telefonoResponsable: "",
      responsableId: 0,
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
      responsableId: responsable.id,
      nombreResponsable: responsable.nombre,
      apellidoResponsable: responsable.apellido,
      emailResponsable: responsable.email,
      telefonoResponsable: responsable.telefono,
    });

    setIsResponsableSelected(true);
  };
  // Manejar cambios en los campos del formulario
  const handleInputChange = (event) => {
    const { name, value } = event.target;

    let errors = { ...formErrors };

    // Validación para el campo "Nombre"
    if (name === "nombre" && value.trim() === "") {
      errors.nombre = 'El campo "Nombre" no puede estar vacío';
    } else if (
      mostrarCamposNohayResponsable &&
      name === "nombreResponsable" &&
      value.trim() === ""
    ) {
      // Validación para el campo "Nombre" cuando se elige la opción "No hay responsable"
      errors.nombreResponsable = 'El campo "Nombre" no puede estar vacío';
    } else if (name === "telefonoResponsable" && !/^\d*$/.test(value)) {
      // Validación para el campo "Teléfono"
      errors.telefonoResponsable =
        'El campo "Teléfono" solo puede contener números';
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
    if (
      formData.nombreResponsable.trim() === "" &&
      mostrarCamposNohayResponsable
    ) {
      errors.nombreResponsable = 'El campo "Nombre" no puede estar vacío';
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

  const getBase64 = (file) => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result);
      reader.onerror = (error) => reject(error);
    });
  };

  const handleConfirm = async () => {
    setOpenConfirm(false);
    setOpenBackdrop(true);
    // Aquí va el código para enviar los datos
    try {

      // Crear un nuevo objeto formData con la fecha formateada
      const formattedFormData = {
        ...formData,
        fechaNacimiento:
          formData.fechaNacimiento !== "date"
            ? format(
                addDays(new Date(formData.fechaNacimiento), 1),
                "yyyy-MM-dd"
              )
            : "",
        esterilizado: Number(formData.esterilizado),
        peso: Number(formData.peso),
        telefonoResponsable: Number(formData.telefonoResponsable),
        foto: selectedFile ? await getBase64(selectedFile) : null,
        //simular un error
        //nombre: '',
      };

      // Enviar datos a la API
      const response = await axios.post(
        "http://animaliaveterinaria:8080/api/pacientes",
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
        setIdRedireccion(response.data.idPaciente);
        // Si todo sale bien, abre el diálogo de éxito
        //console.log("Datos enviados correctamente", response.data);
        setOpenSuccess(true);
        setFormData({
          nombre: "",
          especie: "",
          raza: "",
          sexo: "",
          fechaNacimiento: "date",
          esterilizado: "",
          descripcion: "",
          responsableId: 0,
          nombreResponsable: "",
          apellidoResponsable: "",
          emailResponsable: "",
          telefonoResponsable: "",
          foto: "string",
        });
        setMultipleSelectKey(Date.now());
      } else {
        console.error("Error al enviar datos a la API");
      }
    } catch (error) {
      console.error(error);
      setOpenBackdrop(false);
      //alert("Ha ocurrido un error!, toca el boton para ser redirigido a la pagina principal.");
      //navigate("/home");
      setOpenError(true);
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
            <Grid item xs={12}>
              <Typography variant="h6" gutterBottom>
                Registrar Paciente
              </Typography>
            </Grid>
            <Grid item xs={12}>
              <TextField
                label="Nombre *"
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
                <InputLabel>Esterilizado *</InputLabel>
                <Select
                  label="Esterilizado"
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
            <Grid item xs={12}>
              <VisuallyHiddenInput setSelectedFile={setSelectedFile} />
            </Grid>
            <Divider />
            <Grid item xs={12}>
              <Typography variant="h6" gutterBottom>
                Registrar Responsable
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
                  Seleccionar
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
                  Ingresar Nuevo
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
                    name="nombreResponsable"
                    value={formData.nombreResponsable}
                    onChange={handleInputChange}
                    error={!!formErrors.nombreResponsable}
                    helperText={formErrors.nombreResponsable}
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    label="Apellido"
                    variant="outlined"
                    fullWidth
                    name="apellidoResponsable"
                    value={formData.apellidoResponsable}
                    onChange={handleInputChange}
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    label="Email"
                    variant="outlined"
                    fullWidth
                    name="emailResponsable"
                    value={formData.emailResponsable}
                    onChange={handleInputChange}
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    label="Telefono"
                    variant="outlined"
                    fullWidth
                    name="telefonoResponsable"
                    value={formData.telefonoResponsable}
                    onChange={handleInputChange}
                    error={!!formErrors.telefonoResponsable}
                    helperText={formErrors.telefonoResponsable}
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
            Registrar
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
      {openError && <AlertaError />}
      {openValidacionResponsable && (
        <ValidaciónResponsable onClose={handleCloseValidation} />
      )}
    </Container>
  );
};

export default RegistrarPaciente;
