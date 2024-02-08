import React from "react";
import Paper from "@mui/material/Paper";
import InputBase from "@mui/material/InputBase";
import IconButton from "@mui/material/IconButton";
import SearchIcon from "@mui/icons-material/Search";
import AddIcon from "@mui/icons-material/Add";
import { useNavigate } from "react-router-dom";
import Tooltip from "@mui/material/Tooltip";
import Button from "@mui/material/Button";
import { useTheme } from "@mui/material/styles";
import { useMediaQuery } from "@mui/material";

const BuscarPacienteBarra = ({ onSearch, value }) => {
  const navigate = useNavigate();
  const onAdd = () => {
    navigate("/registrar");
  };
  const theme = useTheme();
  const isSmallScreen = useMediaQuery(theme.breakpoints.down("md"));
  return (
    <Paper
      component="form"
      sx={{
        p: "2px 4px",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        width: "100%",
        marginTop: "40px",
      }}
    >
      <IconButton sx={{ p: "10px" }} aria-label="search">
        <SearchIcon />
      </IconButton>
      <InputBase
        sx={{ ml: 1, flex: 1 }}
        placeholder="Buscar..."
        inputProps={{ "aria-label": "buscar" }}
        value={value}
        onChange={(e) => onSearch(e.target.value)}
      />
      {!isSmallScreen ? (
        <Tooltip title="Añadir Paciente">
          <Button
            variant="contained"
            size="small"
            onClick={onAdd}
            startIcon={<AddIcon />}
            sx={{
              width: "15%",
              backgroundColor: "#6fbe56",
              "&:hover": {
                backgroundColor: "#6fbe56",
                filter: "brightness(1.1)",
              },
            }}
          >
            Paciente
          </Button>
        </Tooltip>
      ) : (
        <Tooltip title="Añadir Paciente">
          <IconButton
            aria-label="añadir paciente"
            onClick={onAdd}
            sx={{ color: "#47351d", "&:hover": { color: "#D09F5C" } }}
          >
            <AddIcon />
          </IconButton>
        </Tooltip>
      )}
    </Paper>
  );
};

export default BuscarPacienteBarra;
