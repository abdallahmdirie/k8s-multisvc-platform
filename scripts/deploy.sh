#!/usr/bin/env bash
set -euo pipefail

TAG="${1:-dev}"

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/api-deploy.yaml -f k8s/api-svc.yaml
kubectl apply -f k8s/web-deploy.yaml -f k8s/web-svc.yaml
kubectl apply -f k8s/ingress.yaml

kubectl -n demo set image deploy/api api=api:${TAG}
kubectl -n demo set image deploy/web web=web:${TAG}

kubectl -n demo rollout status deploy/api
kubectl -n demo rollout status deploy/web
