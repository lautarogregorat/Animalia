import React from "react";
import Container from "@mui/material/Container";
import Grid from "@mui/material/Grid";
import Box from "@mui/material/Box";
import Lista from "./Lista";
import CerrarSesion from "./Botones/CerrarSesion";

function Inicio() {
  return (
    <Container>
      <Grid item xs={12} sm={12} md={12} xl={12}>
        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            marginTop: 5,
          }}
        >
          <Lista></Lista>
        </Box>
      </Grid>
      <Grid>
        <CerrarSesion></CerrarSesion>
      </Grid>
    </Container>
  );
}
export default Inicio;
