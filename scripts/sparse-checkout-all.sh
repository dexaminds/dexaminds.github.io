set -e

mkdir -p docs && cd docs

# API GUIDELINES
mkdir -p api-guidelines && cd api-guidelines
git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds:dexaminds/api-guidelines.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md design-principles.md rest-guidelines.md graphql-guidelines.md versioning.md error-handling.md security.md
git pull origin main
cd ..

# ENGINEERING HANDBOOK
mkdir -p engineering-handbook && cd engineering-handbook
git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds:dexaminds/engineering-handbook.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md coding-standards development-practices
git pull origin main
cd ..

# INTERNAL DOCS
mkdir -p internal-docs && cd internal-docs
git clone --depth=1 --filter=blob:none --sparse git@github.com-dexaminds:dexaminds/docs.git .
git sparse-checkout init --cone
git sparse-checkout set --skip-checks README.md processes tutorials
git pull origin main
cd ../..

# INDEX FILE
cat <<EOF > docs/index.md
# Dexaminds Documentation Hub

Welcome to the internal engineering knowledge base.

## 📚 Sections

- [Docs](internal-docs/)
- [Engineering Handbook](engineering-handbook/)
- [API Guidelines](api-guidelines/)
EOF
