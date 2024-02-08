import React, { useState } from "react";
import Dialog from "@mui/material/Dialog";
import DialogContent from "@mui/material/DialogContent";
import IconButton from "@mui/material/IconButton";
import CloseIcon from "@mui/icons-material/Close";
import { Card, CardActionArea, Box } from "@mui/material";
import SkeletonNoimg from "./Skeletons/SkeletonNoimg";
import { useEffect } from "react";

const FullScreenImage = ({ src }) => {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const url = `data:image/jpeg;base64,${src}`;

  useEffect(() => {
    if (src === "") {
      setLoading(true);
    } else {
      setLoading(false);
    }
  }, [src]);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  return loading ? (
    <SkeletonNoimg />
  ) : (
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
            <img
              src={url}
              alt=""
              style={{
                objectFit: "cover",
                maxHeight: "100%",
                maxWidth: "100%",
              }}
              onClick={handleClickOpen}
            />
          </Box>
        </CardActionArea>
      </Card>
      <Dialog fullScreen open={open} onClose={handleClose}>
        <DialogContent>
          <img
            src={url}
            alt=""
            style={{ objectFit: "cover", maxHeight: "100%", maxWidth: "100%" }}
          />
          <IconButton
            edge="end"
            color="inherit"
            onClick={handleClose}
            aria-label="close"
          >
            <CloseIcon />
          </IconButton>
        </DialogContent>
      </Dialog>
    </>
  );
};

export default FullScreenImage;
