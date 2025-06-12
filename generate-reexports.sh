#!/usr/bin/env bash
# This script generates index files for various ESLint-related packages
# Usage: ./generate-reexports.sh

set -euo pipefail

# Ensure the script is run from the correct directory (package.json location)
if [[ ! -f package.json ]]; then
    echo "This script must be run from the directory containing package.json"
    exit 1
fi

make-export() {
    mkdir -p "./-/$1"
    cat > "./-/$1/index.js" <<EOF
export * from '$1';
export { default } from '$1';
EOF
    echo "Created ./-/$1/index.js"
}

rm -rf ./-

make-export @eslint/js
make-export globals
make-export eslint-plugin-react-hooks
make-export eslint-plugin-react-refresh
make-export typescript-eslint

echo "All re-export index files generated."
