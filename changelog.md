# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- next-header -->

## [Unreleased] - 2025-07-24

### Changed

- Updated `vite.js` to use Vite 7.0.3 ESLint config style, including new `globalIgnores` and config structure.
- Updated dependencies:
  - `@eslint/js` to `^9.30.1`
  - `eslint-plugin-react-refresh` to `^0.4.20`
  - `globals` to `^16.3.0`
  - `typescript-eslint` to `^8.35.1`

## [0.1.3] - 2025-06-12

### Fixed

- Corrected ESM export for `vite` in `index.js`.

## [0.1.2] - 2025-06-12

### Added

- Re-exported `config` from `typescript-eslint` for easier configuration customization.

```ts
import { config } from 'eslint-config-libton'; // re-exported from 'typescript-eslint'
import vite from 'eslint-config-libton/vite';

export default config(vite, {
  name: 'relaxed',
  rules: {
    'prefer-const': 'off',
  },
});
```

## [0.1.1] - 2025-06-12

### Changed

- Updated dependencies to latest compatible versions.

## [0.1.0] - 2025-06-12

### Added

- Initial release with Vite React TypeScript template ESLint config.
- Re-exports for all major dependencies.
- Test script for verifying config and exports.

<!-- next-url -->

[Unreleased]: https://github.com/libton-project/eslint-config-libton/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/libton-project/eslint-config-libton/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/libton-project/eslint-config-libton/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/libton-project/eslint-config-libton/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/libton-project/eslint-config-libton/releases/tag/v0.1.0
