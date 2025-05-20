/// <reference types="vite/client" />

// This file is used to provide type definitions for Vite's client types
// It helps TypeScript understand the special imports like ?url that Vite supports

// Define CSS modules
declare module '*.css' {
  const classes: { [key: string]: string };
  export default classes;
}

// Define CSS modules with ?url suffix
declare module '*.css?url' {
  const url: string;
  export default url;
}

// Define asset imports
declare module '*.svg' {
  const content: string;
  export default content;
}

declare module '*.png' {
  const content: string;
  export default content;
}

declare module '*.jpg' {
  const content: string;
  export default content;
}

// Define Vite's import.meta
interface ImportMeta {
  readonly env: {
    readonly [key: string]: string | undefined;
    readonly VITE_APP_TITLE?: string;
    readonly MODE: string;
    readonly DEV: boolean;
    readonly PROD: boolean;
  };
}
