import React from "react";
import Button from "@mui/material/Button";
import Grid from "@mui/material/Grid";
import AutoFixHighRoundedIcon from "@mui/icons-material/AutoFixHighRounded";
import { useTheme } from "@mui/system";
import VisibilityIcon from "@mui/icons-material/Visibility";
import { useNavigate } from "react-router-dom";
import { Tooltip } from "@mui/material";

const BotonesLista = ({ id }) => {
  const theme = useTheme();
  const navigate = useNavigate();
  const handleClick = () => {
    navigate("/pacientes/" + id + "");
  };
  const handleClickEdit = () => {
    navigate("/pacientes/" + id + "/editar");
  };

  return (
    <Grid
      container
      spacing={2}
      sx={{
        [theme.breakpoints.down("sm")]: {
          flexDirection: "column", // Cambiará a columna en pantallas más pequeñas (mobile)
        },
      }}
    >
      <Grid item>
        <Tooltip title="Ver Paciente">
          <Button
            variant="contained"
            onClick={handleClick}
            size="small"
            sx={{
              width: "100%",
              backgroundColor: "#dda15e",
              "&:hover": {
                backgroundColor: "#D09F5C", // Cambia este color al deseado
              },
            }}
          >
            <VisibilityIcon />
          </Button>
        </Tooltip>
      </Grid>
      <Grid item>
        <Tooltip title="Editar Paciente">
          <Button
            variant="contained"
            size="small"
            onClick={handleClickEdit}
            sx={{
              width: "100%",
              backgroundColor: "#dda15e",
              "&:hover": {
                backgroundColor: "#D09F5C",
              },
            }}
          >
            <AutoFixHighRoundedIcon />
          </Button>
        </Tooltip>
      </Grid>
    </Grid>
  );
};

export default BotonesLista;
