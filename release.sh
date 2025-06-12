#!/usr/bin/env bash
# Usage: ./release.sh <version>
# Updates changelog.md for a new release version.

set -euo pipefail

REPO="libton-project/eslint-config-libton"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>"
  exit 1
fi

if [[ "$1" == v* ]]; then
    VERSION="${1#v}"
else
    VERSION="$1"
fi
DATE="$(date +%Y-%m-%d)"
TAG_NAME="v$VERSION"

CHANGELOG="changelog.md"

# Replace 'Unreleased' with the version
sed -i "0,/Unreleased/s|Unreleased|${VERSION}|" "$CHANGELOG"

# Replace ...HEAD with ...vX.Y.Z (first occurrence only)
sed -i "0,/\.\.\.HEAD/s|\.\.\.HEAD|...${TAG_NAME}|" "$CHANGELOG"

# Replace 'ReleaseDate' with the current date (all occurrences)
sed -i "s|ReleaseDate|${DATE}|g" "$CHANGELOG"

# Insert new Unreleased URL after <!-- next-url -->
sed -i "0,/<!-- next-url -->\n\n\n/s|Unreleased|$VERSION|" "$CHANGELOG"

# Insert new Unreleased section after <!-- next-header -->
sed -i "0,/<!-- next-header -->/s|<!-- next-header -->|<!-- next-header -->\n\n## [Unreleased] - ReleaseDate|" "$CHANGELOG"

# Insert new Unreleased URL after <!-- next-url -->
sed -i "0,/<!-- next-url -->/s|<!-- next-url -->|<!-- next-url -->\n\n[Unreleased]: https://github.com/${REPO}/compare/${TAG_NAME}...HEAD|" "$CHANGELOG"

pnpm format

echo "changelog.md updated for release $VERSION ($DATE)"

pnpm pkg set version="$VERSION"

git add "$CHANGELOG" package.json
git commit -m "release $VERSION"
git tag "$TAG_NAME" -m "Release $VERSION"

cat <<EOF
Release $VERSION has been prepared.
To finalize the release, run:

git push origin main $TAG_NAME
pnpm publish --access public

EOF