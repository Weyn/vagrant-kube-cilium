# Setting up creds for docker hub

Set your credentials in /etc/containerd/config.toml file
```
      [plugins."io.containerd.grpc.v1.cri".registry.configs]
        [plugins."io.containerd.grpc.v1.cri".registry.configs."registry-1.docker.io".auth]
          username = "USERNAME"
          password = "PASS"
```