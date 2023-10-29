# Masterclass
__In the “Container to Pod: From Zero to Hero” masterclass, you’ll dive headfirst into the exciting realm of containerization understand what containers are, and why they matter, and slowly discover the power of Kubernetes.__

## Containers events and history:

* `chroot` in [Unix](https://en.wikipedia.org/wiki/Version_7_Unix) version 7, 1979

* 2015: Docker [donated](https://www.docker.com/blog/runc/) its core container runtime engine [runC](https://github.com/opencontainers/runc) to [OCI](https://opencontainers.org/about/overview/) as a reference implementation

* 2017: Docker [donated](https://thenewstack.io/docker-donate-container-runtime-containerd-cloud-native-computing-foundation/) its core container runtime containerd to CNCF

* From container to pod — [demystifying container runtimes](https://medium.com/faun/from-container-to-pod-demystifying-container-runtimes-a3fd03ee0601)

## Docker 101

* Docker engine
```bash
# check the container runtime
docker system info --format "{{ .DefaultRuntime }}"

# check root directory for Docker storage, defaults to /var/lib/docker
docker info -f '{{ .DockerRootDir}}'

# containers resource usage
docker stats [OPTIONS] [CONTAINER...]
```

* Docker building and shipping images
```bash
# build from remote git repo (disable buildkit)
docker build -t test https://github.com/dejanu/sretoolkit.git#container:docker --no-cache
```