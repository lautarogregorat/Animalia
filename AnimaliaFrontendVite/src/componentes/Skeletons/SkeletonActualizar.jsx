import React from "react";
import { Paper, Typography, Skeleton, Container } from "@mui/material";
import Grid from '@mui/material/Grid';


const SkeletonActualizar = () => {
    return(
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
          <Typography variant="h6" gutterBottom>
                Actualizar Paciente
              </Typography>
          </Grid>
          <Grid item xs={12}>
         <Skeleton variant="rectangular" height={45} />
          </Grid>
          <Grid item xs={12}>
          <Skeleton variant="rectangular" height={45}/>
          </Grid>
          <Grid item xs={12}>
          <Skeleton variant="rectangular" height={45}/>
          </Grid>
          <Grid item xs={12} textAlign={"left"}>
          <Skeleton variant="rectangular" height={45}/>
          </Grid>
          <Grid item xs={12}>
          <Skeleton variant="rectangular"height={45} />
          </Grid>
          <Grid item xs={12} textAlign={"left"}>
          <Skeleton variant="rectangular" height={45}/>
          </Grid>
          <Grid item xs={12}>
          <Skeleton variant="rectangular" height={45} />
          </Grid>
        </Grid>
         <Skeleton variant="rectangular" />
    </Paper>
    </Container>
    )
}
export default SkeletonActualizar;