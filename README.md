# Kubernetes Multi-Service Platform

This repository contains a small but production-style Kubernetes platform built to demonstrate containerization, orchestration, CI/CD, and observability concepts end-to-end.

The project focuses on **how services are built, deployed, updated, and monitored in Kubernetes**, rather than on application complexity.

---

## Architecture Overview

The platform consists of two services deployed into a local Kubernetes cluster:

- **API service**
  - Python (Flask)
  - Exposes a simple JSON endpoint
  - Used to demonstrate rolling updates, scaling, and health checks

- **Web service**
  - NGINX-based static frontend
  - Calls the API through Kubernetes Ingress
  - Used to validate service-to-service routing

Both services are deployed behind a single **Ingress** and exposed locally using Minikube.

