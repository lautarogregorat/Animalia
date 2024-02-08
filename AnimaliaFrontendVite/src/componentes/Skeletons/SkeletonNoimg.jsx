import React from "react";
import Card from "@mui/material/Card";
import CardActionArea from "@mui/material/CardActionArea";
import Box from "@mui/material/Box";
import HideImageIcon from "@mui/icons-material/HideImage";

const SkeletonNoimg = () => {
  return (
    <>
      <Card
        sx={{
          backgroundColor: "#efe6d7",
          transition: "transform .2s", // Agrega una transición suave
          "&:hover": {
            // Cambia el estilo cuando el cursor pasa sobre la tarjeta
            transform: "scale(1.05)", // Aumenta el tamaño de la tarjeta
          },
        }}
      >
        <CardActionArea>
          <Box sx={{ width: "100%", height: "100%", position: "relative" }}>
            <HideImageIcon sx={{ width: "70%", height: "70%" }} />
          </Box>
        </CardActionArea>
      </Card>
    </>
  );
};
export default SkeletonNoimg;
