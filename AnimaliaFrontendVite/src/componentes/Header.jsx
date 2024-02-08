import BorelTtf from "./fonts/Borel-Regular.ttf";
import { createTheme } from "@mui/material/styles";
import { Link } from "react-router-dom";
import fondo from "./fonts/Animalialogo.png";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import { ThemeProvider } from "@mui/material/styles";

const theme = createTheme({
  typography: {
    fontFamily: "Borel, Regular, Roboto",
  },
  components: {
    MuiCssBaseline: {
      styleOverrides: `
         @font-face {
           font-family: 'Borel';
           font-style: normal;
           font-weight: 400;
           align-items: center;
           src: local('Borel'), local('Borel-Regular'), url(${BorelTtf}) format('ttf');
         }
       `,
    },
    /*MuiAppBar: {
       styleOverrides: {
         root: {
           backgroundImage: `url(${fondo})`,
           backgroundSize: 'cover',
           backgroundPosition: 'center',
           backgroundRepeat: 'no-repeat',
         },
       },
     },*/
  },
});

function Header() {
  return (
    <ThemeProvider theme={theme}>
      <AppBar
        position="fixed"
        sx={{
          backgroundColor: "#dda15e",
          zIndex: (theme) => theme.zIndex.drawer + 1,
          height: "45px",
          alignItems: "center",
          justifyContent: "flex-end",
        }}
      >
        <Box
          sx={{
            display: "flex",
            alignItems: "center",
            justifyContent: "flex-end",
            marginTop: "10px",
            transition: "transform 0.2s ease-in-out",
            "&:hover": {
              transform: "scale(1.1)",
              transition: "transform 0.3s ease-in-out",
              // Agrandar la imagen al pasar el mouse
            },
          }}
        >
          <Link to="/home" style={{ textDecoration: "none", color: "inherit" }}>
            <img
              src={fondo}
              alt="Logo"
              style={{
                width: "180px",
                height: "35px",
                marginTop: "10px",
                cursor: "pointer",
              }}
            />
          </Link>
        </Box>
      </AppBar>
    </ThemeProvider>
  );
}

export default Header;
/*
 <Typography variant="h5" component="div" sx={{ flexGrow: 1, color: 'white', textAlign: "center", fontWeight: "bold", cursor: 'pointer', transition: 'opacity 0.3s', // Agregar transición de opacidad
                     '&:hover': { 
                       opacity: 0.8, // Establecer opacidad al pasar el ratón
                     }, }}>
                     Animalia  
                   <PetsOutlinedIcon sx={{ color: 'white', marginLeft:1.5}}></PetsOutlinedIcon>
                </Typography>
 */
