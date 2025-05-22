# Collateral Kubernetes Deployment

This repository contains the Kubernetes manifests to deploy the **Collateral API** and **Frontend** services.

## Prerequisites

Make sure you have the following installed on your machine:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (with Kubernetes enabled)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [Git Bash](https://gitforwindows.org/) (recommended for Windows users)

---

## Deployment Steps

### 1. Enable the Ingress Addon in Minikube

Before deploying, enable the ingress controller addon:

```bash
minikube addons enable ingress
```

---

### 2. Deploy Kubernetes Resources

From the root of the project directory, run:

```bash
kubectl apply -f .
```

---

### 3. Configure Access (Windows Users)

After your pods are running, follow these steps:

#### Patch the Ingress Controller service to use LoadBalancer:

```bash
kubectl patch svc ingress-nginx-controller -n ingress-nginx -p '{"spec": {"type": "LoadBalancer"}}'
```

#### Start the Minikube tunnel to expose the LoadBalancer IP:

```bash
minikube tunnel
```

> **Note:** Running `minikube tunnel` requires administrative privileges and may prompt for your password.

#### Update your Windows hosts file

Add this line to your `C:\Windows\System32\drivers\etc\hosts` file to map the Ingress host to localhost:

```
127.0.0.1  192.168.49.2.nip.io
```

> **Tip:** Use Git Bash or a text editor with administrator rights to edit the hosts file.

---

## Access the Application

* **Frontend:** [http://192.168.49.2.nip.io](http://192.168.49.2.nip.io)
* **API:** [http://192.168.49.2.nip.io/api](http://192.168.49.2.nip.io/api)

---

## Logs

* API logs: `api.log`
* Frontend logs: `web.log`

---

## Troubleshooting

* Confirm Docker Desktop is running with Kubernetes enabled.
* Check pod status:

  ```bash
  kubectl get pods
  ```
* View logs of any pod for debugging:

  ```bash
  kubectl logs <pod-name>
  ```

---

## License

This project is licensed under the MIT License.
