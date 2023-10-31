# Masterclass
__In the “Container to Pod: From Zero to Hero” masterclass, you’ll dive headfirst into the exciting realm of containerization understand what containers are, and why they matter, and slowly discover the power of Kubernetes.__

## Containers events and history:

* `chroot` in [Unix](https://en.wikipedia.org/wiki/Version_7_Unix) version 7, 1979

* 2015: Docker [donated](https://www.docker.com/blog/runc/) its core container runtime engine [runC](https://github.com/opencontainers/runc) to [OCI](https://opencontainers.org/about/overview/) as a reference implementation

* 2017: Docker [donated](https://thenewstack.io/docker-donate-container-runtime-containerd-cloud-native-computing-foundation/) its core container runtime [containerd](https://github.com/containerd/containerd) to CNCF

* From container to pod — [demystifying container runtimes](https://medium.com/faun/from-container-to-pod-demystifying-container-runtimes-a3fd03ee0601) and [the dirty secretes of containers](https://medium.com/faun/the-dirty-secrets-of-containers-1af11bd15e9d)

## Docker 101

* Docker engine [here](https://github.com/dejanu/masterclass/blob/main/docs/dockerengine.md)
```bash
# check the container runtime
docker system info --format "{{ .Runtimes }}"
docker system info --format "{{ .DefaultRuntime }}"

# check root directory for Docker storage, defaults to /var/lib/docker
docker info -f '{{ .DockerRootDir}}'

# containers resource usage
docker stats [OPTIONS] [CONTAINER...]
```

* Docker building and shipping images

    - Container = segregated user-space environments for running applications isolated from other applications sharing the same host OS.

    - Image = read-only templates that contain a runtime environment that includes application libraries and applications.

```bash
# build from cowsay remote git repo (disable buildkit)
docker build -t test https://github.com/dejanu/sretoolkit.git#container:docker --no-cache

# inspect image
docker inspect -f '{{.Config.Cmd}}' test
docker inspect -f '{{.Config.Entrypoint}}' test

# view cmds to layers
docker image history test

# working with air-gapped environments
cd airgapped
docker pull nginx:alpine3.18-slim
docker save nginx:alpine3.18-slim | gzip > nginx.tar.gz
docker rmi nginx:alpine3.18-slim
docker load -i nginx.tar.gz
docker run --rm --name localginx -p 8080:80 nginx:alpine3.18-slim
```
* Build an application using buildpacks: transforming your source code into a runnable app image.
```bash
pack build myapp --builder cnbs/sample-builder:jammy
docker run --rm -p 8080:8080 myapp
```
* An image is a combination of a JSON manifest and individual layer files
* Images are stored in collections, known as a **repository** check ARM [here](https://github.com/dmikusa/paketo-arm64)

* A **registry** instance may contain several repositories
* A [registry](https://docs.docker.com/registry/) e.g. [Dockerhub](https://hub.docker.com/) is a storage and content delivery system, holding named Docker images, available in different tagged versions.

````bash
docker run -d -p 5000:5000 --name registry registry:2
docker image tag alpine:latest localhost:5000/demoalpine
docker push localhost:5000/demoalpine

# retag and push image and just check from browser ;)
http://127.0.0.1:5000/v2/_catalog
```

## Dockerfile

* `Dockerfile` contains instructions that are used to build Docker images, reference [here](https://docs.docker.com/engine/reference/builder/)

* Try a linter like [hadolint](https://github.com/hadolint/hadolint) if you don't like manual stuff: `docker run --rm -i hadolint/hadolint < Dockerfile`


## Links and repositories

* CaaS for boilerplate [here](https://github.com/dejanu/CaaS)
* Dockerhub [here](https://hub.docker.com/u/dejanualex)
