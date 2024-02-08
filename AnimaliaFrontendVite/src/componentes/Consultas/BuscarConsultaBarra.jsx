import React from "react";
import { InputBase, Paper, Grid } from "@mui/material";
import Typography from "@mui/material/Typography";

const BuscarConsultaBarra = ({ onSearch, value }) => {
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
        marginBottom: "40px",
      }}
    >
      <Grid
        container
        direction="row"
        justifyContent="center"
        alignItems="center"
        minWidth={"100%"}
      >
        <Grid item xs={12} sm={3} textAlign={"center"}>
          <Typography
            sx={{ flex: "1 1 100%" }}
            variant="h6"
            id="tableTitle"
            component="div"
            textAlign="center"
          >
            Fichas
          </Typography>
        </Grid>
        <Grid item xs={12} sm={9}>
          <InputBase
            sx={{ ml: 1, flex: 1 }}
            placeholder="Buscar por título..."
            inputProps={{ "aria-label": "buscar" }}
            value={value}
            onChange={(e) => onSearch(e.target.value)}
          />
        </Grid>
      </Grid>
    </Paper>
  );
};

export default BuscarConsultaBarra;
