# Collateral Kubernetes Deployment

This repository contains the Kubernetes manifests required to deploy the **Collateral API** and **Frontend** services.

## Prerequisites

Ensure you have the following installed on your machine:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Ensure Kubernetes is enabled)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [Git Bash](https://gitforwindows.org/) (for Windows users)

---

## Deployment Steps

### 1. Apply Kubernetes Manifests

Run the following command in the root of the project directory to deploy all Kubernetes resources:

```bash
kubectl apply -f .
```

---

### 2. Port Forward Services (For Windows Users)

Once the containers are confirmed to be running, use Git Bash to forward the necessary ports.

#### Start the API service:

```bash
nohup kubectl port-forward svc/collateral-api-service 8080:8008 > api.log 2>&1 &
```

#### Start the Web Frontend service:

```bash
nohup kubectl port-forward svc/collateral-web-service 3000:3000 > web.log 2>&1 &
```

> **Note**: If `nohup` is not recognized, ensure you're using **Git Bash**, not Command Prompt or PowerShell.

---

## Access the Application

* **API**: [http://localhost:8080](http://localhost:8080)
* **Frontend**: [http://localhost:3000](http://localhost:3000)

---

## Logs

* API logs: `api.log`
* Frontend logs: `web.log`

---

## Troubleshooting

* Ensure Docker is running and Kubernetes is enabled.
* Run `kubectl get pods` to check if all pods are up and running.
* Use `kubectl logs <pod-name>` to inspect pod-specific logs for debugging.

---

## License

This project is licensed under the MIT License.
