import React from "react";
import { Tooltip } from "@mui/material";
import { useNavigate } from "react-router-dom";
import Button from "@mui/material/Button";
import AutoAwesomeIcon from "@mui/icons-material/AutoAwesome";

const BotonEditImagen = (props) => {
  const navigate = useNavigate();
  const handleButtonClick = () => {
    // Redirigir a la URL deseada cuando se hace clic en el botón
    navigate(`/pacientes/consultas/EditarImagen/${props.idPaciente}`);
  };
  return (
    <Tooltip title="Agregar Imagen">
      <Button
        size="small"
        variant="contained"
        color="primary"
        onClick={handleButtonClick}
        startIcon={<AutoAwesomeIcon />}
        sx={{
          marginTop: "10px",
          marginBottom: "10px",
          marginRight: "12px",
          backgroundColor: "#dda15e",
          "&:hover": {
            backgroundColor: "#D09F5C", // Cambia este color al deseado
          },
        }}
      >
        Actualizar Foto
      </Button>
    </Tooltip>
  );
};

export default BotonEditImagen;
