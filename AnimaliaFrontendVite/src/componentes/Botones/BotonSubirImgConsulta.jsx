import React from "react";
import Tooltip from "@mui/material/Tooltip";
import { useNavigate } from "react-router-dom";
import Button from "@mui/material/Button";
import CloudUploadIcon from "@mui/icons-material/CloudUpload";

const BotonVerImgConsulta = (props) => {
  const navigate = useNavigate();
  const handleButtonClick = () => {
    // Redirigir a la URL deseada cuando se hace clic en el botón
    navigate(
      `/pacientes/fichas/actualizarImagen?idPaciente=${props.idPaciente}&idConsulta=${props.idConsulta}`
    );
  };
  return (
    <Tooltip title="Subir Imagen">
      <Button
        variant="contained"
        size="small"
        onClick={handleButtonClick}
        sx={{
          backgroundColor: "#b1b838",
          "&:hover": { backgroundColor: "#b1b838", filter: "brightness(.95)" },
        }}
        startIcon={<CloudUploadIcon />}
      >
        Cargar imagen
      </Button>
    </Tooltip>
  );
};
export default BotonVerImgConsulta;
