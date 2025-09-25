# eslint-config-libton

A shareable ESLint configuration for Libton projects, based on the official [Vite React TypeScript template v6.5.0][vite-eslint-config].

## Goal

- Reduce the number of dependencies users need to install and maintain for the eslint configuration.
- Provide a configuration compatible with ESLint 9.
- Stay close to the Vite React TypeScript template.

## Installation

```sh
pnpm add -D eslint-config-libton
# or
npm install --save-dev eslint-config-libton
```

You should also have `eslint` (v9+) installed in your project.

## Usage

Create an `eslint.config.js` in your project root:

```js
import vite from 'eslint-config-libton/vite';

export default vite;
```

This applies the same ESLint configuration used in the Vite React TypeScript template, including support for React, TypeScript, and modern browser globals.

### Customization

You can customize the configuration using the `defineConfig` helper, which is re-exported from `eslint/config`:

```js
import { defineConfig } from 'eslint-config-libton'; // re-exported from 'eslint/config'
import vite from 'eslint-config-libton/vite';

export default defineConfig(vite, {
  name: 'relaxed',
  rules: {
    'prefer-const': 'off',
  },
});
```

## Re-exports

This package re-exports its dependencies for convenience. You can import them directly if you need to extend or customize your config:

```js
import js from 'eslint-config-libton/-/@eslint/js';
import globals from 'eslint-config-libton/-/globals';
import reactHooks from 'eslint-config-libton/-/eslint-plugin-react-hooks';
import reactRefresh from 'eslint-config-libton/-/eslint-plugin-react-refresh';
import tseslint from 'eslint-config-libton/-/typescript-eslint';
```

## Reference

- [Vite React TypeScript ESLint Config (source)][vite-eslint-config]

## License

MIT

[vite-eslint-config]: https://github.com/vitejs/vite/blob/create-vite%406.5.0/packages/create-vite/template-react-ts/eslint.config.js
