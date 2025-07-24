new vite version 7.0.3 have a new eslint config file, so we need to update our package to use it.

```
import js from '@eslint/js'
import globals from 'globals'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import tseslint from 'typescript-eslint'
import { globalIgnores } from 'eslint/config'

export default tseslint.config([
  globalIgnores(['dist']),
  {
    files: ['**/*.{ts,tsx}'],
    extends: [
      js.configs.recommended,
      tseslint.configs.recommended,
      reactHooks.configs['recommended-latest'],
      reactRefresh.configs.vite,
    ],
    languageOptions: {
      ecmaVersion: 2020,
      globals: globals.browser,
    },
  },
])
```

and this package.json diff:

```
-    "@eslint/js": "^9.25.0",
-    "@types/react": "^19.1.2",
-    "@types/react-dom": "^19.1.2",
-    "@vitejs/plugin-react": "^4.4.1",
-    "eslint": "^9.25.0",
+    "@eslint/js": "^9.30.1",
+    "@types/react": "^19.1.8",
+    "@types/react-dom": "^19.1.6",
+    "@vitejs/plugin-react": "^4.6.0",
+    "eslint": "^9.30.1",
     "eslint-plugin-react-hooks": "^5.2.0",
-    "eslint-plugin-react-refresh": "^0.4.19",
-    "globals": "^16.0.0",
+    "eslint-plugin-react-refresh": "^0.4.20",
+    "globals": "^16.3.0",
     "typescript": "~5.8.3",
-    "typescript-eslint": "^8.30.1",
-    "vite": "^6.3.5"
+    "typescript-eslint": "^8.35.1",
+    "vite": "^7.0.4"
```

@ai: chagne vite.js and package.json to update config and versions.
