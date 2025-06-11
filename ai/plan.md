# `eslint-config-libton` plan

This is a package to group eslint config dependencies. we gone start with the eslint config from vite react-ts template. then we will relax some of the rules. and my be adding some more rules to it.

our package will provide a default config based on the vite react-ts template eslint config. so that users can use it like this:

```js
import vite from 'eslint-config-libton/vite';
```

our package will also provide re-export for its dependencies, so that users can use it like this:

```js
import js from 'eslint-config-libton/@eslint/js';
import globals from 'eslint-config-libton/globals';
```

<!--
todo: is this a good path for re-exports? should we add prefix like `-` to the package name?
```js
import js from 'eslint-config-libton/-/@eslint/js'
import globals from 'eslint-config-libton/-/globals'
```

@ai: give me suggestions for the re-export path.
-->

## vite config

this is vite react-ts template eslint config (eslint.config.js):

<!-- @ai: do not change this code. it is copied form vite repo -->

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

## react app config

I like the way `eslint-config-react-app` works. it was a good, but relaxed config. but it is not compatible with eslint 9. our config should be compatible with eslint 9.

source of `eslint-config-react-app` is here: https://github.com/facebook/create-react-app/blob/main/packages/eslint-config-react-app

## eslint-config-libton package

this package will provide a default config based on the vite react-ts template eslint config. it will also provide re-exports for its dependencies.

this package will be hosted in this repository: https://github.com/libton-project/eslint-config-react-app

### tasks to be done by ai

- [ ] a bash script that generate re-exports for its dependencies.
- [ ] a good package.json for this package.
- [ ] a good README.md for this package.
- [ ] `eslint-config-react-app/vite` based on vite
