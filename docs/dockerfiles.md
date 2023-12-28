### Best-practices

* Base images should not use the `latest` tag.

* DL3025 warning: Use arguments JSON notation for [CMD](https://docs.docker.com/engine/reference/builder/#cmd) and ENTRYPOINT arguments
```Dockerfile
# good (exec form as defaults params)
CMD ["param1","param2"] (as default parameters to ENTRYPOINT)

# bad (shell form)
CMD command param1 param2
```

* DOK-DL3009 warning: Cleaning up the apt cache and removing `/var/lib/apt/lists` helps keep the image size [down](https://app.deepsource.com/directory/analyzers/docker/issues/DOK-DL3009), used in the same `RUN` step
```Dockerfile
# good
RUN apt-get update && apt-get install -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# bad
RUN apt-get update && apt-get install -y python
```