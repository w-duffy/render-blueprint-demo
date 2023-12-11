import { defineConfig } from "vite";
import eslintPlugin from "vite-plugin-eslint";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig((mode) => ({
  plugins: [
    react(),
    eslintPlugin({
      lintOnStart: true,
      failOnError: mode === "production",
    }),
  ],
  server: {
    open: true,
    port: 3000,
    proxy: {
      "/api": "http://127.0.0.1:8000",
    },
  },
}));

// import { defineConfig } from "vite";
// import eslintPlugin from "vite-plugin-eslint";
// import react from "@vitejs/plugin-react";


// export default defineConfig({

//   // ↓↓↓ change to logLevel: 'info' ↓↓↓
//   logLevel: 'info',
//   // ↑↑↑ change to logLevel: 'info' ↑↑↑

//   plugins: [react()],
//   server: {
//     host: process.env.VITE_HOST || null,
//     port: process.env.VITE_PORT || null,
//     hmr: {
//       clientPort: process.env.VITE_CLIENT_PORT || null
//     },
//     proxy: {
//       '^/web': {
//         target: 'http://web',
//         // target: '/',
//         changeOrigin: true
//       }
//     }
//   }
// })

// https://vitejs.dev/config/
// export default defineConfig((mode) => ({
//   plugins: [
//     react(),
//     eslintPlugin({
//       lintOnStart: true,
//       failOnError: mode === "production",
//     }),
//   ],
//   server: {
//     host: true,
//     port: 5173,
//   //  hmr: {
//   //     clientPort: 3000,
//   //     host: '0.0.0.0',
//   //   },
//     // proxy: {
//     //   "/api": "http://backend:8000",
//     // },

//     proxy: {
//       // this doesn't sem to work - it did work locally"
//       "/api": "http://127.0.0.1:8000",
//       //trying this instead
//       // "/api": "http://localhost:8000",
//       // "/api": "http://web:8000",
//       // "/web": "http://0.0.0.0:8000"
//     },
//   },
// }));
