// keycloak.js
import Keycloak from "keycloak-js";

const initKeycloak = async () => {
  const keycloak = new Keycloak({
    url: "http://animaliaveterinaria.com.ar:8180/auth",
    realm: "animalia",
    clientId: "animalia",
    onLoad: "login-required",
  });

  await keycloak.init({
    onLoad: "login-required",
    checkLoginIframe: false,
  });

  return keycloak;
};

export default initKeycloak;