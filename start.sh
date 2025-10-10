#!/usr/bin/env bash

set -e

HOST_UID=$(id -u)
HOST_GID=$(id -g)

case "$1" in
build)
  echo "🔨 Building dev container..."
  HOST_UID=$HOST_UID HOST_GID=$HOST_GID docker compose down -v --rmi all
  HOST_UID=$HOST_UID HOST_GID=$HOST_GID docker compose up -d --build
  ;;
"")
  echo "💻 Attaching to container shell..."
  HOST_UID=$HOST_UID HOST_GID=$HOST_GID docker compose up -d
  HOST_UID=$HOST_UID HOST_GID=$HOST_GID docker compose exec dev zsh
  ;;
*)
  echo "Usage: $0 [build]"
  ;;
esac
