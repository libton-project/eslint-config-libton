# Prior Art and References

This project draws inspiration from existing ESLint configuration solutions, particularly:

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
