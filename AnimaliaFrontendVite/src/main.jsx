// Importaciones necesarias
import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom/client';
import App from './App.jsx';
import './index.css';
import CssBaseline from '@mui/material/CssBaseline';
import { BrowserRouter as Router } from "react-router-dom";
import Header from './componentes/Header.jsx';
import { AuthProvider } from './context/AuthContext.jsx';
import initKeycloak from './context/keycloak';
import SimpleBackdrop from './componentes/SimpleBackdrop';

// Componente principal
function Main() {
  const [keycloak, setKeycloak] = useState(null);

  useEffect(() => {
    const initializeKeycloak = async () => {
      const keycloakInstance = await initKeycloak();
      setKeycloak(keycloakInstance);
    };
    initializeKeycloak();
  }, []);

  // Renderiza la app solo si keycloak está definido
  if (!keycloak) {
    return <SimpleBackdrop open={true} />;
  }

  return (
    <AuthProvider keycloakInstance={keycloak}>
      <Router>
        <CssBaseline />
        <Header />
        <App />
      </Router>
    </AuthProvider>
  );
}

// Inicialización de ReactDOM
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Main />);


/*ReactDOM.createRoot(document.getElementById('root')).render(
  <Router>
    <CssBaseline />
    <Header></Header>
    <App />
  </Router>
);
*/
