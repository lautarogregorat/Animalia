import React from "react";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import AutoFixHighRoundedIcon from "@mui/icons-material/AutoFixHighRounded";
import { useTheme } from "@mui/system";
import VisibilityIcon from "@mui/icons-material/Visibility";
import { useNavigate } from "react-router-dom";
import ButtonGroup from "@mui/material/ButtonGroup";

const BotonesLista = ({ idPaciente, idConsulta }) => {
  const theme = useTheme();
  const navigate = useNavigate();
  const handleClick = () => {
    navigate(
      `/pacientes/fichas?idPaciente=${idPaciente}&idConsulta=${idConsulta}`
    );
  };

  const handleClickEdit = () => {
    navigate(
      `/pacientes/fichas/actualizar?idPaciente=${idPaciente}&idConsulta=${idConsulta}`
    );
  };

  return (
    <Grid
      container
      spacing={5}
      sx={{
        [theme.breakpoints.down("sm")]: {
          flexDirection: "column", // Cambiará a columna en pantallas más pequeñas (mobile)
        },
      }}
    >
      <Grid item>
        <ButtonGroup size="small" aria-label="small button group">
          <Button
            variant="contained"
            onClick={handleClick}
            size="small"
            sx={{
              width: "100%",
              backgroundColor: "#dda15e",
              "&:hover": {
                backgroundColor: "#D09F5C",
                mb: "1", // Cambia este color al deseado
              },
            }}
          >
            <VisibilityIcon size="small" />
          </Button>
          <Button
            variant="contained"
            onClick={handleClickEdit}
            size="small"
            sx={{
              width: "100%",
              backgroundColor: "#dda15e",
              "&:hover": {
                backgroundColor: "#D09F5C", // Cambia este color al deseado
              },
            }}
          >
            <AutoFixHighRoundedIcon size="small" />
          </Button>
        </ButtonGroup>
      </Grid>
    </Grid>
  );
};

export default BotonesLista;
