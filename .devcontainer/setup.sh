#!/usr/bin/env bash
set -euo pipefail

clone_or_update () {
  REPO_URL="$1"
  TARGET_DIR="$2"
  if [ -d "$TARGET_DIR/.git" ]; then
    echo "Updating $TARGET_DIR..."
    git -C "$TARGET_DIR" pull --ff-only
  else
    echo "Cloning $REPO_URL into $TARGET_DIR..."
    git clone --depth 1 "$REPO_URL" "$TARGET_DIR"
  fi
}

ORG="haanmetric-wq"

# AstroCrown constellation repos
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.docs.git"        "AstroCrown-ACS.docs"
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.core.git"        "AstroCrown-ACS.core"
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.benchmarks.git"  "AstroCrown-ACS.benchmarks"
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.results.git"     "AstroCrown-ACS.results"
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.governance.git"  "AstroCrown-ACS.governance"
clone_or_update "https://github.com/$ORG/AstroCrown-ACS.data.git"        "AstroCrown-ACS.data"

echo "AstroCrown constellation ready."
