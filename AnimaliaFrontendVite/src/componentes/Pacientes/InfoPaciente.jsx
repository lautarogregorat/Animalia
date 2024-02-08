import React from "react";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import Skeleton from "@mui/material/Skeleton";
import Box from "@mui/material/Box";
import {
  differenceInYears,
  differenceInMonths,
  differenceInDays,
} from "date-fns";
import BotonEditImagen from "../Botones/BotonEditImagen";
import BotonEditarPaciente from "../Botones/BotonEditarPaciente";
import BotonEditResponsable from "../Botones/BotonEditResponsable";
import SkeletonConsultarPaciente from "../Skeletons/SkeletonConsultarPaciente";

const InfoPaciente = ({ mascota }) => {
  if (!mascota || !mascota.responsablesByResponsableId) {
    return <SkeletonConsultarPaciente />;
  }
  // Verificar si la fecha de nacimiento está presente y no es undefined
  const fechaNacimiento = mascota.fechaNacimiento
    ? new Date(mascota.fechaNacimiento)
    : null;

  // Validar si la fecha de nacimiento es válida y la edad no es -1
  const edadValida = fechaNacimiento && mascota.edad !== -1;

  // Obtener el día, el mes y el año de la fecha de nacimiento

  if (fechaNacimiento !== null) {
    const dia = fechaNacimiento.getDate();
    const mes = fechaNacimiento.getMonth();
    const anio = fechaNacimiento.getFullYear();

    // Verificar si el día es el último día del mes
    if (dia === 31) {
      // Si es el último día del mes, establecer el día al primer día del próximo mes
      fechaNacimiento.setDate(1);
      fechaNacimiento.setMonth(mes + 1);
    } else {
      // Si no es el último día del mes, incrementar el día
      fechaNacimiento.setDate(dia + 1);
    }
  }

  // Formatear la fecha en el formato Día/Mes/Año si es válida, de lo contrario mostrar mensaje
  const fechaFormateada = edadValida
    ? `${fechaNacimiento.getDate()}/${
        fechaNacimiento.getMonth() + 1
      }/${fechaNacimiento.getFullYear()}`
    : "Fecha no cargada";

  // Calcular la edad en años, meses y días
  function calculateAge(birthDate) {
    let birthDateObj = new Date(birthDate);
    birthDateObj.setHours(0, 0, 0, 0);

    const now = new Date();
    now.setHours(0, 0, 0, 0);

    const years = differenceInYears(now, birthDateObj);
    const months = differenceInMonths(now, birthDateObj);
    let days = differenceInDays(now, birthDateObj);

    return { years, months, days };
  }

  const edad = calculateAge(fechaNacimiento);

  // Mostrar mensaje si la edad es -1, de lo contrario mostrar la edad
  let edadMostrada =
    mascota.edad !== -1
      ? edad.years > 0
        ? `${edad.years} ${edad.years === 1 ? "año" : "años"}`
        : edad.months > 0
        ? `${edad.months} ${edad.months === 1 ? "mes" : "meses"}`
        : `${edad.days} ${edad.days === 1 ? "día" : "días"}`
      : "La edad no se puede calcular";

  return (
    <Paper
      elevation={3}
      style={{ padding: "20px", maxWidth: "400px", margin: "auto" }}
    >
      <Typography variant="h5" gutterBottom>
        Información del Paciente
      </Typography>
      <Divider />
      <Typography variant="subtitle1" gutterBottom>
        Nombre: {mascota.nombre}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Especie: {mascota.especie}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Raza: {mascota.raza}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Sexo: {mascota.sexo}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Fecha de Nacimiento: {fechaFormateada}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Edad: {edadMostrada}
      </Typography>
      <Typography variant="subtitle1" gutterBottom>
        Esterilizado: {mascota.esterilizado ? "Sí" : "No"}
      </Typography>
      <Divider />
      <Typography variant="subtitle1">
        Responsable: {mascota.responsablesByResponsableId.nombre}{" "}
        {mascota.responsablesByResponsableId.apellido}
      </Typography>
      <Typography variant="subtitle1">
        Email: {mascota.responsablesByResponsableId.email}
      </Typography>
      <Typography variant="subtitle1">
        Telefono: {mascota.responsablesByResponsableId.telefono}
      </Typography>
      <Divider />
      <Paper style={{ width: "100%" }} sx={{ backgroundColor: "#efe6d7" }}>
        {mascota ? (
          <img
            alt="Imagen"
            src={`data:image/jpeg;base64,${mascota.foto}`}
            style={{ width: "100%", height: "auto", objectFit: "cover" }}
          />
        ) : (
          <Skeleton variant="rect" width="100%" height={118} />
        )}
        <Box p={2}>
          <Typography variant="body2">
            {mascota ? mascota.descripcion : <Skeleton />}
          </Typography>
        </Box>
      </Paper>
      <Divider />
      <BotonEditImagen idPaciente={mascota.idPaciente}></BotonEditImagen>
      <BotonEditarPaciente id={mascota.idPaciente}></BotonEditarPaciente>
      <BotonEditResponsable
        idPaciente={mascota.idPaciente}
        idResponsable={mascota.responsablesByResponsableId.idResponsable}
      ></BotonEditResponsable>
    </Paper>
  );
};

export default InfoPaciente;
