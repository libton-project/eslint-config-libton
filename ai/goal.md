# `eslint-config-libton` Goals

This package aims to provide a unified ESLint configuration solution by bundling ESLint config dependencies. We'll start with the ESLint configuration from the Vite React TypeScript template, then customize it by relaxing certain rules and potentially adding new ones.

The package will provide a default configuration based on the Vite React TypeScript template's ESLint config, allowing users to easily integrate it like this:

```js
import vite from 'eslint-config-libton/vite';
```

Additionally, the package will re-export its dependencies, enabling users to access them directly:

```js
import js from 'eslint-config-libton/-/@eslint/js';
import globals from 'eslint-config-libton/-/globals';
```

## Goals

1. Provide a default configuration based on the Vite React TypeScript template
2. Re-export all dependencies for direct user access
3. Maintain compatibility with the latest ESLint version
4. Offer a modern, maintainable structure

## Package Structure

This package will be hosted in the [libton-project/eslint-config-react-app](https://github.com/libton-project/eslint-config-react-app) repository and will provide:

- A default configuration based on the Vite React TypeScript template
- Re-exports for all dependencies
- A modern, maintainable structure compatible with ESLint 9
