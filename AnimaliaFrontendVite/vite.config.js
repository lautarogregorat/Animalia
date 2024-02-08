import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    // Escuchar en todas las interfaces de red
    host: '0.0.0.0',
    // Asegúrate de que el puerto aquí coincida con el puerto expuesto en tu docker-compose.yml
  },


});
