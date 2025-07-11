#!/bin/bash
set -e

export GIT_SSH_COMMAND="ssh -F ~/.ssh/config"

SOURCE_FILE="scripts/docs-sources.json"

rm -rf docs
mkdir -p docs && cd docs

jq -c '.[]' "../$SOURCE_FILE" | while read -r entry; do
  target=$(echo "$entry" | jq -r '.target')
  repo=$(echo "$entry" | jq -r '.repo')
  alias=$(echo "$entry" | jq -r '.alias // "github.com"')
  [[ -z "$alias" ]] && alias="github.com"
  paths=$(echo "$entry" | jq -r '.paths | join(" ")')

  echo "📁 Cloning $repo into $target using alias: $alias"
  mkdir -p "$target"
  cd "$target"

  GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse "git@${alias}:${repo}.git" .

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
