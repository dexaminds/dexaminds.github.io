#!/bin/bash

# Function to configure sparse checkout for a documentation directory
configure_sparse_checkout() {
  local dir="$1"
  shift
  local files=("$@")
  
  if [ -d "$dir" ]; then
    echo "Configuring sparse checkout for $dir"
    cd "$dir" || exit 1
    git sparse-checkout init --cone
    git sparse-checkout set --skip-checks "${files[@]}"
    cd - >/dev/null || exit 1
  else
    echo "Directory $dir not found, skipping..."
  fi
}

# Main script
echo "Setting up sparse checkouts for documentation submodules..."

# API Guidelines
configure_sparse_checkout "docs/api-guidelines" \
  "README.md" \
  "design-principles.md" \
  "rest-guidelines.md" \
  "graphql-guidelines.md" \
  "versioning.md" \
  "error-handling.md" \
  "security.md"

# Engineering Handbook
configure_sparse_checkout "docs/engineering-handbook" \
  "README.md" \
  "coding-standards" \
  "development-practices"

# Internal Docs
configure_sparse_checkout "docs/internal-docs" \
  "README.md" \
  "processes" \
  "tutorials"

echo "Sparse checkout configuration complete"
