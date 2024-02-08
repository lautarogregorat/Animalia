import React from "react";
import Paper from "@mui/material/Paper";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import Skeleton from "@mui/material/Skeleton";
import Box from '@mui/material/Box';

const SkeletonConsultarPaciente = () => {
    
    return(
        <Paper elevation={3} style={{ padding: "20px", maxWidth: "400px", margin: "auto" }}>
        <Typography variant="h5" gutterBottom>
           Información del Paciente
        </Typography>
        <Divider />
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Nombre: 
             <Skeleton variant="text" width={150} />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Especie: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Raza: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Sexo: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Fecha de Nacimiento:
             <Skeleton variant="text" width={150} />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Edad: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Typography variant="subtitle1" gutterBottom>
           <Box display="flex" alignItems="center">
             Esterilizado: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Divider />
        <Typography variant="subtitle1">
           <Box display="flex" alignItems="center">
             Responsable: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Typography variant="subtitle1">
           <Box display="flex" alignItems="center">
             Email: 
             <Skeleton variant="text" width={150} />
           </Box>
        </Typography>
        <Typography variant="subtitle1">
           <Box display="flex" alignItems="center">
             Telefono: 
             <Skeleton variant="text" width={150}  />
           </Box>
        </Typography>
        <Divider />
        <Paper style={{ width: '100%', }} sx={{ backgroundColor: "#efe6d7" }}>
           <Skeleton
             variant="rectangular"
             height={200}
           />
           <Box p={2}>
             <Typography variant="body2">
               <Box display="flex" alignItems="center">
                 {<Skeleton variant="text" width={150}  />}
               </Box>
             </Typography>
           </Box>
        </Paper>
        <Divider />
       </Paper>
    )
}

export default SkeletonConsultarPaciente;