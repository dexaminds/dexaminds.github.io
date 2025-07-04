# Dexaminds Documentation Hub

[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-brightgreen.svg)](https://dexaminds.github.io/)
[![MkDocs Material](https://img.shields.io/badge/MkDocs-Material-blue.svg)](https://squidfunk.github.io/mkdocs-material/)
[![Docker](https://img.shields.io/badge/Docker-Container-2496ED?logo=docker)](https://www.docker.com/)

Welcome to the Dexaminds Documentation Hub, the central knowledge base for Dexaminds' engineering team. This repository contains the source files for our public-facing documentation website.

## 📖 Overview

This documentation serves as the single source of truth for Dexaminds' engineering practices, API guidelines, and internal processes. It's built using [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme, containerized with Docker for easy development and deployment.

---

## 🚀 Getting Started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine for Linux)
- Git
- SSH access to private repositories

#### SSH Setup (choose one)

##### ➤ Single User (basic key setup)

1. Add your SSH key to `~/.ssh/id_rsa`
2. Add the following to `~/.ssh/config`:

    ```ssh
    Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_rsa
        IdentitiesOnly yes
    ```

##### ➤ Multi-User or Org Key Setup (aliases)

1. Add your keys to `~/.ssh/`
    - `id_admin_dexaminds_rsa`

2. Add to `~/.ssh/config`:

    ```ssh

    Host github.com-dexaminds-second
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_admin_dexaminds_rsa
        IdentitiesOnly yes
    ```

3. Run:
    ```bash
    ssh-keyscan github.com >> ~/.ssh/known_hosts
    ```

---

### Local Development with Docker

1. **Clone the repository**

    ```bash
    git clone https://github.com/dexaminds/dexaminds.github.io.git
    cd dexaminds.github.io
    ```

2. **Set up documentation with sparse checkout**

    ```bash
    chmod +x ./scripts/sparse-checkout-all.sh
    ./scripts/sparse-checkout-all.sh
    ```

3. **Build the custom Docker image**

    ```bash
    docker build -t dexaminds-docs .
    ```

4. **Start the development server**

    ```bash
    docker run --rm -it -p 8000:8000 -v "/$(pwd -W)":/docs dexaminds-docs
    ```

    **For Windows (cmd.exe):**

    ```cmd
    docker run --rm -it -p 8000:8000 -v "%cd%":/docs dexaminds-docs
    ```

---

## 📦 Managing Documentation Sources

Documentation sources are fetched from private repositories using **modular sparse checkout**.

All repo sources are defined in:

```
scripts/docs-sources.txt
```

### ➕ To Add a New Source Repo

1. Edit `scripts/docs-sources.txt` and add:

    ```txt
    <target-folder>|<repo-ssh-url>|<comma-separated sparse paths>
    ```

    Example:

    ```txt
    guides|git@github.com-dexaminds-second:dexaminds/new-guides.git|README.md,intro.md,setup.md
    ```

2. Run:

    ```bash
    ./scripts/sparse-checkout-all.sh
    ```

---

## 📂 Project Structure

```
.
├── docs/
│   ├── api-guidelines/
│   ├── engineering-handbook/
│   ├── internal-docs/
│   └── index.md
├── site/
├── .github/
├── scripts/
├── mkdocs.yml
└── README.md
```

---

## 📝 Documentation Sections

1. **Docs** – Internal processes, tutorials, deployments
2. **Engineering Handbook** – Coding standards, Git workflow, testing
3. **API Guidelines** – REST, GraphQL, versioning, error handling

---

## 🤝 Contributing

1. Fork this repository
2. Create a branch for your changes
3. Make edits and commit
4. Push to your fork
5. Submit a Pull Request

---

## 📄 License

MIT License – see [LICENSE](LICENSE)

---

## 🙏 Acknowledgments

- [MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Docker](https://www.docker.com/)
- Dexaminds team contributors 💙