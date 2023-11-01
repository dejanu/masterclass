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