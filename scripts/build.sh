#!/usr/bin/env bash
set -euo pipefail

eval "$(minikube -p minikube docker-env)"
TAG="${1:-dev}"

docker build -t api:${TAG} ./services/api
docker build -t web:${TAG} ./services/web
