#!/bin/bash
set -e

export GIT_SSH_COMMAND="ssh -F ~/.ssh/config"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Load environment variables from .env file if it exists
if [ -f "$PROJECT_ROOT/.env" ]; then
    echo "Loading environment variables from $PROJECT_ROOT/.env"
    set -a
    source "$PROJECT_ROOT/.env"
    set +a
else
    echo "Warning: No .env file found at $PROJECT_ROOT/.env"
fi

# Set default alias if not defined in .env
GITHUB_ALIAS=${GH_HOST_ALIAS:-github.com}

SOURCE_FILE="scripts/docs-sources.json"

rm -rf docs
mkdir -p docs && cd docs

jq -c '.[]' "../$SOURCE_FILE" | while read -r entry; do
  target=$(echo "$entry" | jq -r '.target')
  repo=$(echo "$entry" | jq -r '.repo')
  paths=$(echo "$entry" | jq -r '.paths | join(" ")')

  echo "📁 Cloning $repo into $target using host name: $GITHUB_ALIAS"
  mkdir -p "$target"
  cd "$target"

  GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse "git@${GITHUB_ALIAS}:${repo}.git" .

  git sparse-checkout init --cone
  git sparse-checkout set --skip-checks $paths
  git pull origin main
  cd ..
done

# Create root index
cat <<EOF > index.md
# Dexaminds Documentation Hub

Welcome to the internal engineering knowledge base.

## 📚 Sections

- [Docs](internal-docs/)
- [Engineering Handbook](engineering-handbook/)
- [API Guidelines](api-guidelines/)
EOF

echo "✅ Sparse checkout complete."
