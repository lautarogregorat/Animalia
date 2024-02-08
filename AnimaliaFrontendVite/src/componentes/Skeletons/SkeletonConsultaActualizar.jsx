import React from "react";
import Container from "@mui/material/Container";
import AppBar from "@mui/material/AppBar";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import Paper from "@mui/material/Paper";
import Grid from "@mui/material/Grid";
import Skeleton from "@mui/material/Skeleton";
import IconButton from "@mui/material/IconButton";
import ArrowBackIosNewIcon from "@mui/icons-material/ArrowBackIosNew";
import { useNavigate } from "react-router-dom";

const SkeletonConsultaActualizar = () => {
  const navigate = useNavigate();
  return (
    <Container
      sx={{
        marginTop: "5rem",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        minWidth: "70%",
      }}
    >
      <AppBar
        position="static"
        mb={4}
        style={{
          backgroundColor: "#ffffff",
          height: "50px",
          borderBottom: "none",
          boxShadow: "none",
        }}
      >
        <Toolbar
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <IconButton
            edge="start"
            color="black"
            aria-label="back"
            onClick={() => navigate(-1)}
          >
            <ArrowBackIosNewIcon />
          </IconButton>
          <Typography
            variant="h6"
            component="div"
            color="black"
            sx={{ flexGrow: 1, textAlign: "center" }}
          >
            Actualizar Ficha
          </Typography>
        </Toolbar>
      </AppBar>
      <Paper elevation={0} style={{ padding: "20px", minWidth: "100%" }}>
        <Grid
          container
          direction="column"
          justifyContent="center"
          alignItems="center"
        >
          <Grid
            item
            xs={12}
            sm={6}
            minWidth={"100%"}
            alignItems="center"
            justifyContent="center"
          >
            <Skeleton variant="rectangular" height={450} />
          </Grid>
        </Grid>
      </Paper>
    </Container>
  );
};

export default SkeletonConsultaActualizar;
