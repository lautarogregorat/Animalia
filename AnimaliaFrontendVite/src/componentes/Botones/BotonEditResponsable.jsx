import React from "react";
import Button from "@mui/material/Button";
import AutoFixHighRoundedIcon from "@mui/icons-material/AutoFixHighRounded";
import { useNavigate } from "react-router-dom";
import { Tooltip } from "@mui/material";

const BotonEditarPaciente = ({ idPaciente, idResponsable }) => {
  const navigate = useNavigate();
  const handleClickEdit = () => {
    navigate(
      `/pacientes/editarResponsable?idPaciente=${idPaciente}&idResponsable=${idResponsable}`
    );
  };

  return (
    <Tooltip title="Editar Responsable">
      <Button
        variant="contained"
        size="small"
        onClick={handleClickEdit}
        sx={{
          marginBottom: "10px",
          marginTop: "10px",
          backgroundColor: "#dda15e",
          "&:hover": {
            backgroundColor: "#D09F5C",
          },
        }}
        startIcon={<AutoFixHighRoundedIcon />}
      >
        Actualizar Responsable
      </Button>
    </Tooltip>
  );
};

export default BotonEditarPaciente;
