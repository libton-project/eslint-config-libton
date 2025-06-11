# `eslint-config-libton` Plan

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

## Vite Configuration

Below is the ESLint configuration from the Vite React TypeScript template (eslint.config.js):

<!-- @ai: This code is copied from the Vite repository and should not be modified -->

```js
import js from '@eslint/js';
import globals from 'globals';
import reactHooks from 'eslint-plugin-react-hooks';
import reactRefresh from 'eslint-plugin-react-refresh';
import tseslint from 'typescript-eslint';

export default tseslint.config(
  { ignores: ['dist'] },
  {
    extends: [js.configs.recommended, ...tseslint.configs.recommended],
    files: ['**/*.{ts,tsx}'],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
    plugins: {
      'react-hooks': reactHooks,
      'react-refresh': reactRefresh,
    },
    rules: {
      ...reactHooks.configs.recommended.rules,
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],
    },
  },
);
```

## React App Configuration

We appreciate the approach taken by `eslint-config-react-app`, which provides a well-balanced and relaxed configuration. However, since it's not compatible with ESLint 9, our configuration will be designed to work with the latest ESLint version while maintaining similar principles.

Reference: [eslint-config-react-app source](https://github.com/facebook/create-react-app/blob/main/packages/eslint-config-react-app)

## Package Structure

This package will be hosted in the [libton-project/eslint-config-react-app](https://github.com/libton-project/eslint-config-react-app) repository and will provide:

1. A default configuration based on the Vite React TypeScript template
2. Re-exports for all dependencies
3. A modern, maintainable structure compatible with ESLint 9

### Development Tasks

- [ ] Develop a comprehensive package.json configuration
- [ ] [Develop and execute test plan](./plan-test.md)
- [ ] Create a bash script to generate dependency re-exports
- [ ] Write a detailed README.md with usage instructions
- [ ] Implement the `eslint-config-react-app/vite` configuration based on Vite's template
