# vagrant-kube-cilium
![error](images/devops-meme.webp)

# Why this way?
Just to learn vagrant and manual kubernetes setup.

# What's included?
CNI - Cilium (https://docs.cilium.io/en/stable/cheatsheet/)

# How to start?
1. Install vagrant (https://www.vagrantup.com/docs/installation)
2. Cd to repo and run:
```
vagrant up
```
3. Profit!

# Config
Update Vagrantfile NUM_WORKER_NODES if you want more than 1 child node.

To change the IP update IP_NW

# Future plans
- Add ansible, puppet and more.

# Quick start alternatives
kind (https://kind.sigs.k8s.io/)
k3s (https://k3s.io/) - My favourite due to the size and performance
minikube (https://github.com/kubernetes/minikube) (https://minikube.sigs.k8s.io/docs/)