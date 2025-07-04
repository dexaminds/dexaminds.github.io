#!/bin/bash
set -e

export GIT_SSH_COMMAND="ssh -F ~/.ssh/config"

DOCS_DIR="docs"
CONFIG_FILE="scripts/docs-sources.txt"

# Ensure base docs folder
rm -rf "$DOCS_DIR"
mkdir -p "$DOCS_DIR"
cd "$DOCS_DIR"

# Loop through each line in config file
while IFS='|' read -r target_folder repo_url sparse_paths || [[ -n "$target_folder" ]]; do
  # Skip comments or empty lines
  [[ "$target_folder" =~ ^#.*$ || -z "$target_folder" ]] && continue

  echo "🔄 Cloning $repo_url into $target_folder with sparse paths: $sparse_paths"

  mkdir -p "$target_folder"
  cd "$target_folder"

  GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse "$repo_url" .
  git sparse-checkout init --cone
  git sparse-checkout set --skip-checks $(echo "$sparse_paths" | tr ',' ' ')
  git pull origin main

  cd ..
done < "../$CONFIG_FILE"

# Generate index.md
cat <<EOF > index.md
# DexaMinds Knowledge Hub

Welcome to the internal engineering knowledge base.

## 📚 Sections

- [Docs](internal-docs/)
- [Engineering Handbook](engineering-handbook/)
- [API Guidelines](api-guidelines/)
EOF

echo "✅ Sparse checkout complete and index.md created at docs/index.md"
