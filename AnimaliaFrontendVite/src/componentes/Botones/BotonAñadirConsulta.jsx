import React from "react";
import { Tooltip, IconButton } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import { useNavigate } from "react-router-dom";

const BotonAñadirConsulta = (props) => {
  const navigate = useNavigate();
  const handleButtonClick = () => {
    // Redirigir a la URL deseada cuando se hace clic en el botón
    navigate("/pacientes/consultas/" + props.id + "");
  };
  return (
    <Tooltip title="Añadir Ficha">
      <IconButton
        onClick={handleButtonClick}
        sx={{ color: "#47351d", "&:hover": { color: "#D09F5C" } }}
      >
        <AddIcon />
      </IconButton>
    </Tooltip>
  );
};
export default BotonAñadirConsulta;
