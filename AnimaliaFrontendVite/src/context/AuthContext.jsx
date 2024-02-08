// AuthContext.js
import React, { createContext, useContext, useState } from "react";

const AuthContext = createContext();

export const AuthProvider = ({ children, keycloakInstance }) => {
  const [keycloak, setKeycloak] = useState(keycloakInstance);

  const login = () => {
    // Puedes agregar lógica adicional si es necesario al iniciar sesión
  };

  const logout = () => {
    if (keycloak) {
      keycloak.logout();
    }
  };

  return (
    <AuthContext.Provider value={{ keycloak, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);