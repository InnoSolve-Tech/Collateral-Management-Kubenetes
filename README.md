# Collateral Kubernetes Deployment

This repository contains the Kubernetes manifests required to deploy the **Collateral API** and **Frontend** services using **Minikube** and **NGINX Ingress Controller**.

---

## ✅ Prerequisites

Ensure the following tools are installed on your machine:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/)

  > Enable Kubernetes via Docker Desktop settings.

* [kubectl](https://kubernetes.io/docs/tasks/tools/)

  > Command-line tool for interacting with Kubernetes clusters.

* [Git Bash](https://gitforwindows.org/) (for Windows users)

  > Required to run Linux-like commands such as `nohup` and `minikube tunnel`.

---

## 🚀 Deployment Steps

### 1. Enable the Ingress Addon in Minikube

To enable the NGINX ingress controller in your local Minikube cluster, run:

```bash
minikube addons enable ingress
```

---

### 2. Deploy Kubernetes Manifests

From the root of the project directory, apply all Kubernetes configurations:

```bash
kubectl apply -f .
```

---

### 3. Configure Access (For Windows Users)

Once your pods are up and running:

#### a. Patch the Ingress Controller service to use LoadBalancer:

```bash
kubectl patch svc ingress-nginx-controller -n ingress-nginx \
  -p '{"spec": {"type": "LoadBalancer"}}'
```

#### b. Start the Minikube tunnel to expose the LoadBalancer IP:

```bash
minikube tunnel
```

> 🔒 **Note:** This command may require administrator privileges and will prompt for your password. It keeps running in the background to forward traffic properly.

#### c. Edit your Windows `hosts` file

Open `C:\Windows\System32\drivers\etc\hosts` as an administrator and add the following line:

```
127.0.0.1  collateral.local
```

> 💡 **Tip:** Use Notepad (Run as Administrator) or Git Bash with elevated permissions to edit this file.

---

## 🌐 Access the Application

After setup is complete:

* **Frontend:** [http://collateral.local](http://collateral.local)
* **API Base URL:** [http://collateral.local/api/v1](http://collateral.local/api/v1)

---

## 🧪 Troubleshooting

If you encounter any issues:

1. **Check Pod Status**

```bash
kubectl get pods
```

2. **View Pod Logs**

```bash
kubectl logs <pod-name>
```

3. **Check Services**

```bash
kubectl get svc
```

4. **Check Ingress**

```bash
kubectl get ingress
```

---

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).