# Kubernetes Multi-Service Platform

This repository contains a small but production style Kubernetes platform built to demonstrate containerization, orchestration, CI/CD, and observability end-to-end.

The project keeps the application logic intentionally simple so the focus stays on **platform mechanics** (build → deploy → route → monitor → update).



## Architecture Overview

The platform consists of two services deployed into a local Kubernetes cluster:

- **API service**
  - Python (Flask)
  - Exposes a JSON endpoint for testing rollouts and scaling
  - Includes health checks for liveness/readiness

- **Web service**
  - NGINX based static frontend
  - Calls the API through Kubernetes Ingress
  - Validates service-to-service routing

Ingress routes traffic like this:

- `/` → **web**
- `/api` → **api**



## Technology Stack

- Docker (multi-service containerization)
- Kubernetes (Deployments, Services, Ingress)
- Minikube (local Kubernetes cluster)
- GitHub Actions (CI/CD with self-hosted runner)
- Prometheus + Grafana (monitoring and dashboards)



## CI/CD Pipeline

This project uses **GitHub Actions with a self-hosted runner** running on the same machine as the Minikube cluster.

On every push to `main`, the pipeline:

1. Builds Docker images for both services
2. Loads images into Minikube’s Docker daemon
3. Deploys updated workloads to Kubernetes
4. Waits for successful rollouts
5. Performs a smoke test through Ingress (`/api`)

This approach keeps the deployment automated while remaining realistic for a local cluster.



## Monitoring & Observability

Cluster monitoring is implemented using **kube-prometheus-stack** (Prometheus + Grafana).

Dashboards are used to view:
- Node resource usage
- Namespace-level pod metrics
- Workload CPU and memory consumption
- Pod restarts and health

Grafana is accessed locally via port-forward and dashboards can be filtered to the `demo` namespace.



## Repository Structure

```text
.
├── services/
│   ├── api/        # Flask API service + Dockerfile
│   └── web/        # NGINX web frontend + Dockerfile
├── k8s/            # Kubernetes manifests (namespace, deploy, svc, ingress)
├── scripts/        # Build/deploy scripts used locally and by CI/CD
└── .github/
    └── workflows/  # GitHub Actions workflow
