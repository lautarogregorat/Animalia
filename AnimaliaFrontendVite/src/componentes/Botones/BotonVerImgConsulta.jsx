import React from "react";
import Tooltip from "@mui/material/Tooltip";
import VisibilityIcon from "@mui/icons-material/Visibility";
import { useNavigate } from "react-router-dom";
import Button from "@mui/material/Button";

const BotonVerImgConsulta = (props) => {
  const navigate = useNavigate();
  const handleButtonClick = () => {
    // Redirigir a la URL deseada cuando se hace clic en el botón
    navigate(
      `/pacientes/consultas/Ver/Imagen?idPaciente=${props.idPaciente}&idConsulta=${props.idConsulta} `
    );
  };
  return (
    <Tooltip title="Ver Imagen">
      <Button
        variant="contained"
        size="small"
        onClick={handleButtonClick}
        sx={{
          backgroundColor: "#dda15e",
          "&:hover": {
            backgroundColor: "#D09F5C",
          },
        }}
        startIcon={<VisibilityIcon />}
      >
        Ver Imagen
      </Button>
    </Tooltip>
  );
};
export default BotonVerImgConsulta;
