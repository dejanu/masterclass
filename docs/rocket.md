# Rocket container engine

* `rkt` is a app container engine
* `rkt` is a single binary that integrates with init systems, scripts, and complex devops pipelines
* It is built from the ground up with security in mind. While Docker runs as a daemon, Rkt doesnt. Instead, it runs as a static binary

# Running containers based on Docker images:

* Rocket converts the Docker image to application container format

```bash
sudo ./rkt --insecure-options=image run docker://dejanualex/dockersay:2.1

# --insecure-options=image
# find a signature (.asc file) to check the integrity of the Docker image
# This is to disable signature verification, which is enabled by default in rkt. Signing images is easily done using standard gpg tools
```
