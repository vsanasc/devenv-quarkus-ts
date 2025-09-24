# Development Environment

This repository provides a reproducible development environment using **Docker** and **Docker Compose**.  
It includes common tools (Neovim, Zsh, tmux, Docker CLI, SDKMAN, NVM, etc.) for software development in a fully containerized setup.

---

## Features

- **Debian Bookworm Slim** base image
- **Zsh** with [Oh My Zsh](https://ohmyz.sh/) and `zsh-autosuggestions`
- **Neovim** (latest release) preconfigured with custom settings
- **tmux**, `fzf`, `ripgrep`, `fd-find`, `bat`, `tree`
- **Docker CLI & Compose plugin** inside the container
- **SDKMAN** for managing JVM-based tools
  - Kotlin
  - Java
  - Quarkus
- **NVM** for managing Node.js
  - Node.js 22 installed by default
- Runs as a non-root `dev` user with matching host UID/GID
- Mounts your local `./workspace` into `/home/dev/workspace`

---

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/) (v2+ recommended)
- Linux/macOS (tested with Docker Desktop on macOS)

---

## Setup

Clone this repository and build the container:

```bash
./start.sh build
./start.sh

