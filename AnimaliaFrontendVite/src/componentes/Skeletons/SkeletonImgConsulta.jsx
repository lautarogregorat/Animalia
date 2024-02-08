import React from "react";
import Card from '@mui/material/Card';
import CardActionArea from '@mui/material/CardActionArea';
import Skeleton from '@mui/material/Skeleton';
import Box from '@mui/material/Box';
import Grid from '@mui/material/Grid';

const SkeletonImgConsulta = () => {
    return (
        <Grid
            container
            direction="row"
            justifyContent="center"
            alignItems="center"
            p={10}
            spacing={{ xs: 2, md: 3 }}
        >
            <Grid item xs={12} sm={6} md={4}>
                <Card sx={{
                    backgroundColor: '#efe6d7',
                    transition: 'transform .2s', // Agrega una transición suave
                    '&:hover': { // Cambia el estilo cuando el cursor pasa sobre la tarjeta
                        transform: 'scale(1.05)', // Aumenta el tamaño de la tarjeta
                    },
                }}>
                    <CardActionArea>
                        <Box sx={{ width: "100%", height: "100%", position: "relative" }}>
                            <Skeleton variant="rectangular" height={200} />
                        </Box>
                    </CardActionArea>
                </Card>
            </Grid>
            <Grid item xs={12} sm={6} md={4}>
                <Card sx={{
                    backgroundColor: '#efe6d7',
                    transition: 'transform .2s', // Agrega una transición suave
                    '&:hover': { // Cambia el estilo cuando el cursor pasa sobre la tarjeta
                        transform: 'scale(1.05)', // Aumenta el tamaño de la tarjeta
                    },
                }}>
                    <CardActionArea>
                        <Box sx={{ width: "100%", height: "100%", position: "relative" }}>
                            <Skeleton variant="rectangular" height={200} />
                        </Box>
                    </CardActionArea>
                </Card>
            </Grid>
        </Grid>
    );
}

export default SkeletonImgConsulta;