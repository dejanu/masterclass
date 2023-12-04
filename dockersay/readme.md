# Cowsay/Dockersay images

## Build
```bash
# cowsay
docker build -t dejanualex/dockersay:1.0 -f cowDockerfile .
# dockersay
docker build -t dejanualex/dockersay:2.0 -f .
```

## Usage
```bash
# cowsay
docker run dejanualex/dockersay:1.0
# dockersay
docker run dejanualex/dockersay:2.0
```

* Docker hub repo [dejanualex/whalesay](https://hub.docker.com/r/dejanualex/dockersay)

# Kubernetes
```bash
# start the app overriding the args
kubectl run cowsay --image=dejanualex/dockersay:1.0 --restart=Never -- Test me


# start the app overriding the command
kubectl run cowsay --image=dejanualex/dockersay:1.0 --restart=Never --command -- cowsay

# check args and command
kubectl get po cowsay -ojsonpath="{.spec.containers[0].args}"
kubectl get po cowsay -ojsonpath="{.spec.containers[0].command}"
```