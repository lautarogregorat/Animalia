import React from "react";
import Button from "@mui/material/Button";
import AutoFixHighRoundedIcon from "@mui/icons-material/AutoFixHighRounded";
import { useNavigate } from "react-router-dom";
import { Tooltip } from "@mui/material";

const BotonEditarPaciente = ({ id }) => {
  const navigate = useNavigate();
  const handleClickEdit = () => {
    navigate("/pacientes/" + id + "/editar");
  };

  return (
    <Tooltip title="Editar Paciente">
      <Button
        variant="contained"
        size="small"
        onClick={handleClickEdit}
        sx={{
          backgroundColor: "#dda15e",
          "&:hover": {
            backgroundColor: "#D09F5C",
          },
        }}
        startIcon={<AutoFixHighRoundedIcon />}
      >
        Actualizar Datos
      </Button>
    </Tooltip>
  );
};

export default BotonEditarPaciente;
