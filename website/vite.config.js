import { defineConfig } from 'vite'
import preact from '@preact/preset-vite'
import tailwind from '@tailwindcss/vite';

// https://vite.dev/config/
export default defineConfig({
  base: '/',  
  plugins: [preact(), tailwind()],
})
