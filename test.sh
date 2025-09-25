#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get the repository path (default to current directory)
REPO_PATH=${1:-$(pwd)}
echo "Using repository path: $REPO_PATH"

echo "Starting eslint-config-libton test..."

# Create temporary test directory
TEST_DIR=$(mktemp -d)
echo "Created test directory: $TEST_DIR"

# Function to clean up
cleanup_all() {
    echo "Cleaning up..."
    rm -rf "$TEST_DIR"
    if [[ -n "$PACKAGE_PATH" ]]; then
        echo "Cleaning up package..."
        rm -f "$REPO_PATH/$PACKAGE_PATH"
    fi
}
trap cleanup_all EXIT

# Initialize test project
cd "$TEST_DIR"
echo "Initializing test project..."
pnpm init
pnpm pkg set type="module";

# Create test file structure
mkdir -p src
cat > src/test.ts << 'EOF'
// Test file for eslint-config-libton
const test = 'test';
export default test;
EOF

cat > src/test-let.ts << 'EOF'
// Test file for eslint-config-libton
let test = 'test';
export default test;
EOF

# Create eslint config
cat > eslint.config.js << 'EOF'
import { vite, defineConfig, config } from 'eslint-config-libton';
import vite2 from 'eslint-config-libton/vite';
import globals from 'eslint-config-libton/-/globals';

console.assert(globals.browser, '⚠️ globals.browser should be defined');
console.assert(defineConfig, '⚠️ defineConfig should be defined');
console.assert(config, '⚠️ config should be defined');
console.assert(vite, '⚠️ vite should be defined');
console.assert(vite2, '⚠️ vite2 should be defined');
console.assert(vite2 === vite, '⚠️ vite2 should be the same as vite');

export default vite;
EOF

# Build and pack eslint-config-libton
cd "$REPO_PATH"
echo "Packing eslint-config-libton..."
PACKAGE_PATH=$(pnpm pack | tail -n 1)

# Install the package in test project
cd "$TEST_DIR"
echo "Installing eslint-config-libton..."
pnpm add "$REPO_PATH/$PACKAGE_PATH"

# Install required dependencies
echo "Installing dependencies..."
pnpm add -D eslint typescript @types/node

# Run ESLint
echo "Running ESLint..."
if pnpm eslint src/test.ts; then
    echo -e "${GREEN}ESLint test passed!${NC}"
else
    echo -e "${RED}ESLint test failed!${NC}"
    exit 1
fi

if pnpm eslint src/test-let.ts; then
    echo -e "${RED}ESLint test should have failed but passed!${NC}"
    exit 1
else
    echo -e "${GREEN}ESLint correctly failed on let declaration!${NC}"
fi

cat > eslint.config.js << 'EOF'
import { defineConfig } from 'eslint-config-libton';
import vite from 'eslint-config-libton/vite';

export default defineConfig(vite, {
  name: 'relaxed',
  rules: {
    'prefer-const': 'off',
  },
});
EOF

if pnpm eslint src/test-let.ts; then
    echo -e "${GREEN}ESLint test passed after relaxing rules!${NC}"
else
    echo -e "${RED}ESLint test failed after relaxing rules!${NC}"
    exit 1
fi

echo -e "${GREEN}All tests passed!${NC}"
