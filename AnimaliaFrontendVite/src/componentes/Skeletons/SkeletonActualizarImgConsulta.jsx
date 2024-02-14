import React from "react";
import Container from "@mui/material/Container";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import Skeleton from "@mui/material/Skeleton";
import Divider from "@mui/material/Divider";


const SkeletonActualizarImgConsulta = () => {
  return (
    <Container maxWidth="sm" sx={{ textAlign: "center", marginTop: "70px" }}>
      <Paper
        elevation={3}
        sx={{
          backgroundColor: "white",
          boxShadow: "0px 0px 10px 0px rgba(0, 0, 0, 0.1)",
          borderRadius: "8px",
          padding: "20px",
        }}
      >
        <Grid container spacing={2}>
          <Grid item xs={12}>
            <Skeleton variant="text" width="100%" height="40px" />
            <Divider />
          </Grid>
          <Grid item xs={12}>
            <Skeleton variant="text" width="100%" height="40px" />
          </Grid>
          <Grid item xs={12}>
            <Skeleton variant="text" width="100%" height="40px" />
            <Divider />
          </Grid>
          <Grid item xs={12} mb={2}>
            <Skeleton variant="text" width="100%" height="40px" />
          </Grid>
        </Grid>
        <Skeleton variant="text" width="100%" height="40px" />
      </Paper>
    </Container>
  );
};
export default SkeletonActualizarImgConsulta;
