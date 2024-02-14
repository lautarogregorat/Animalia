import * as React from "react";
import { useTheme } from "@mui/material/styles";
import FormControl from "@mui/material/FormControl";
import axios from "axios";
import Autocomplete from "@mui/material/Autocomplete";
import TextField from "@mui/material/TextField";
import { useAuth } from "../context/AuthContext";

export default function MultipleSelect(props) {
  const theme = useTheme();
  const authContext = useAuth();
  const [personName, setPersonName] = React.useState([]);
  const [responsables, setResponsable] = React.useState([]);
  const [responsableSeleccionado, setResponsableSeleccionado] = React.useState(
    null
  );

  React.useEffect(() => {
    axios
      .get("http://animaliaveterinaria.com.ar:8080/api/responsables", {
        headers: {
          Authorization: `Bearer ${authContext.keycloak.token}`,
        },
      })
      .then((response) => {
        setResponsable(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
    props.onDeselectResponsable();
  }, []);

  return (
    <div>
      <FormControl sx={{ m: 1, width: 300 }}>
        <Autocomplete
          disablePortal
          id="combo-box-demo"
          options={responsables}
          getOptionLabel={(option) => option.apellido + " " + option.nombre}
          sx={{ width: 300 }}
          renderInput={(params) => (
            <TextField {...params} label="Responsable" />
          )}
          onChange={(event, newValue) => {
            setPersonName(
              newValue ? newValue.nombre + " " + newValue.apellido : ""
            );
            setResponsableSeleccionado(newValue);
            if (newValue) {
              props.onResponsableChange(newValue);
            } else {
              // Llama a la función de deselección cuando se deselecciona un responsable
              props.onDeselectResponsable();
            }
          }}
        />
      </FormControl>

      {responsableSeleccionado && (
        <div>
          <p>Email: {responsableSeleccionado.email}</p>
          <p>Telefono: {responsableSeleccionado.telefono}</p>
        </div>
      )}
    </div>
  );
}
