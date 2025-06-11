# Test Plan for `eslint-config-libton`

This document outlines the testing strategy for the `eslint-config-libton` package, focusing on verifying the package structure and basic functionality.

## Internal Verification

### Source Code Verification

- [ ] Verify index.js
  - [ ] Check all re-exports are properly defined
  - [ ] Verify export paths match package.json
  - [ ] Check for any unnecessary code
- [ ] Verify vite.js
  - [ ] Check configuration matches Vite React TypeScript template
  - [ ] Verify all required plugins are included
  - [ ] Check rule configurations are correct

### Package.json Verification

- [ ] Check dependencies
  - [ ] Verify all required dependencies are listed
  - [ ] Check for any unnecessary dependencies
  - [ ] Verify peer dependencies are correct
- [ ] Check exports field
  - [ ] Verify all paths are correct
  - [ ] Check for any missing exports
  - [ ] Verify re-export paths are valid

## End-to-End Testing

### Create a temporary test directory

- [ ] Create a new directory for testing
- [ ] Initialize a new Node.js project with pnpm
- [ ] Create a minimal test file structure

### Test package installation

- [ ] Build the package locally
- [ ] Create a tarball using `pnpm pack`
- [ ] Install the package in the test project
- [ ] Verify all dependencies are installed correctly

### Test ESLint configuration

- [ ] Create a minimal eslint.config.js
- [ ] Import and use the vite config
- [ ] Run ESLint on a simple TypeScript file
- [ ] Verify ESLint runs without errors

## Test Files Structure

```
test-project/
├── src/
│   └── test.ts
├── eslint.config.js
└── package.json
```

## Success Criteria

The test is considered successful when:

1. Internal code structure is correct and clean
2. Package.json configuration is complete and accurate
3. All re-exports are accessible
4. ESLint configuration loads and runs without errors
5. No unnecessary files or dependencies are included
