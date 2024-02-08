import React from "react";
import Button from "@mui/material/Button";
import LogoutIcon from "@mui/icons-material/Logout";
import { useAuth } from "../../context/AuthContext";
import { useTheme } from "@mui/material/styles";
import { useMediaQuery } from "@mui/material";
import Tooltip from "@mui/material/Tooltip";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";

const CerrarSesion = () => {
  const { logout } = useAuth();
  const theme = useTheme();
  const isSmallScreen = useMediaQuery(theme.breakpoints.down("md"));

  return !isSmallScreen ? (
    <Tooltip title="Cerrar Sesion">
      <Button
        variant="contained"
        size="small"
        onClick={logout}
        startIcon={<LogoutIcon />}
        sx={{
          width: "15%",
          backgroundColor: "#47351d",
          "&:hover": { backgroundColor: "#47351d", filter: "brightness(0.9)" },
        }}
      >
        Cerrar Sesion
      </Button>
    </Tooltip>
  ) : (
    <Tooltip title="Cerrar Sesion">
      <IconButton
        onClick={logout}
        sx={{ color: "#47351d", "&:hover": { color: "#D09F5C" } }}
      >
        <Typography variant="text" sx={{ fontSize: "smaller" }}>
          <LogoutIcon /> Salir
        </Typography>
      </IconButton>
    </Tooltip>
  );
};

export default CerrarSesion;
