#!/bin/bash
set -e

# Use custom SSH config explicitly
export GIT_SSH_COMMAND="ssh -F ~/.ssh/config"

# Ensure parent directory
mkdir -p docs && cd docs

# 1. API GUIDELINES SUBMODULE
mkdir -p api-guidelines && cd api-guidelines
GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds-second:dexaminds/api-guidelines.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md \
  design-principles.md \
  rest-guidelines.md \
  graphql-guidelines.md \
  versioning.md \
  error-handling.md \
  security.md
git pull origin main
cd ..

# 2. ENGINEERING HANDBOOK SUBMODULE
mkdir -p engineering-handbook && cd engineering-handbook
GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds-second:dexaminds/engineering-handbook.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md \
  coding-standards \
  development-practices
git pull origin main
cd ..

# 3. INTERNAL DOCS SUBMODULE
mkdir -p internal-docs && cd internal-docs
GIT_SSH_COMMAND="ssh -F ~/.ssh/config" git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds-second:dexaminds/docs.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md \
  processes \
  tutorials
git pull origin main
cd ..

# 4. Create index.md
cat <<EOF > index.md
# Dexaminds Documentation Hub

Welcome to the internal engineering knowledge base.

## 📚 Sections

- [Docs](internal-docs/)
- [Engineering Handbook](engineering-handbook/)
- [API Guidelines](api-guidelines/)
EOF

echo "✅ Sparse checkout complete and index.md created at docs/index.md"
