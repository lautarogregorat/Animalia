import React from 'react';
import Skeleton from '@mui/material/Skeleton';
import Container from '@mui/material/Container';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';

const SkeletonResponsable = () => {
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
              <Divider />
              <Grid item xs={12}>
                <Typography variant="h6" gutterBottom>
                  Actualizar Datos del Responsable
                </Typography>
                <Skeleton variant="text" width={"100%"} />
                <Skeleton variant="text" width={"100%"} />
              </Grid>
                <>
                  <Grid item xs={12}>
                  <Skeleton variant="text" width={"100%"} />
                  </Grid>
                  <Grid item xs={12}>
                  <Skeleton variant="text" width={"100%"} />
                  </Grid>
                  <Grid item xs={12}>
                  <Skeleton variant="text" width={"100%"} />
                  </Grid>
                  <Grid item xs={12}>
                  <Skeleton variant="text" width={"100%"} />
                  </Grid>
                </>
            </Grid>
            <Skeleton variant="text" width={"100%"} />
        </Paper>
        </Container>
    )
}

export default SkeletonResponsable;