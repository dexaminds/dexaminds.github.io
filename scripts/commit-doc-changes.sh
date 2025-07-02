#!/bin/bash

# Script to commit and push documentation changes
# Usage: ./scripts/commit-doc-changes.sh [commit_message]

set -e  # Exit on error

# Default commit message
DEFAULT_MSG="chore: update documentation"
COMMIT_MSG="${1:-$DEFAULT_MSG}"

# Documentation directories to check
DOC_DIRS=(
  "docs/api-guidelines"
  "docs/engineering-handbook"
  "docs/internal-docs"
)

# Add all documentation directories
echo "Staging documentation changes..."
for dir in "${DOC_DIRS[@]}"; do
  git add "$dir"
done

# Check if there are any changes to commit
if ! git diff --cached --quiet; then
  echo "Committing changes with message: $COMMIT_MSG"
  git commit -m "$COMMIT_MSG"
  
  # Only push if we're in CI environment
  if [ -n "$CI" ]; then
    echo "Pushing changes to main branch..."
    git push origin main
  else
    echo "Not in CI environment, skipping push"
  fi
else
  echo "No documentation changes to commit"
fi
