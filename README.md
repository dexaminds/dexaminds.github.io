# Dexaminds Documentation Hub

[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-brightgreen.svg)](https://dexaminds.github.io/)
[![MkDocs Material](https://img.shields.io/badge/MkDocs-Material-blue.svg)](https://squidfunk.github.io/mkdocs-material/)
[![Docker](https://img.shields.io/badge/Docker-Container-2496ED?logo=docker)](https://www.docker.com/)

Welcome to the Dexaminds Documentation Hub, the central knowledge base for Dexaminds' engineering team. This repository contains the source files for our public-facing documentation website.

## 📖 Overview

This documentation serves as the single source of truth for Dexaminds' engineering practices, API guidelines, and internal processes. It's built using [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme, containerized with Docker for easy development and deployment.

## 🚀 Getting Started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine for Linux)
- Git

### Local Development with Docker

1. **Clone the repository**
   ```bash
   git clone https://github.com/dexaminds/dexaminds.github.io.git
   cd dexaminds.github.io
   ```

2. **Initialize Git Submodules**
   
   The documentation uses Git submodules for different sections. Initialize them with:
   
   ```bash
   git submodule update --init --recursive
   ```

3. **Build the custom Docker image**
   ```bash
   docker build -t dexaminds-docs .
   ```

4. **Start the development server**
   ```bash
   docker run --rm -it -p 8000:8000 -v "/$(pwd -W)":/docs dexaminds-docs
   ```
   **For Windows Command Prompt (cmd.exe):**
   ```cmd
   docker run --rm -it -p 8000:8000 -v "%cd%":/docs dexaminds-docs
   ```
   - The site will be available at `http://localhost:8000`
   - Auto-reload is enabled by default - your changes will be reflected instantly

### Common Docker Commands

- **Stop the server**: Press `Ctrl+C` in the terminal
- **View site**: Open `http://localhost:8000` in your browser
- **Check MkDocs version**:
  ```bash
  docker run --rm dexaminds-docs --version
  ```

## 📂 Project Structure

```
.
├── docs/                    # Documentation source files
│   ├── api-guidelines/      # API design and usage guidelines
│   ├── engineering-handbook/ # Engineering best practices
│   ├── internal-docs/       # Internal documentation
│   └── index.md             # Documentation homepage
├── site/                   # Generated site (do not edit directly)
├── .github/                # GitHub configuration
├── mkdocs.yml              # MkDocs configuration
└── README.md               # This file
```

## 📝 Documentation Sections

1. **Docs**
   - Internal documentation including processes and tutorials
   - Code review guidelines
   - Deployment processes
   - Local environment setup

2. **Engineering Handbook**
   - Coding standards (JavaScript, Python)
   - Development practices
   - Git workflow
   - Testing strategy

3. **API Guidelines**
   - Design principles
   - REST and GraphQL guidelines
   - Versioning strategy
   - Error handling
   - Security best practices

## 🤝 Contributing

We welcome contributions to improve our documentation! Here's how you can help:

1. Fork the repository
2. Create a new branch for your changes
3. Make your changes and commit them
4. Push to your fork and submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Docker](https://www.docker.com/)
- All contributors who help improve our documentation
