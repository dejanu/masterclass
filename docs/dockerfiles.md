### Best-practices


* DL3025 warning: Use arguments JSON notation for [CMD](https://docs.docker.com/engine/reference/builder/#cmd) and ENTRYPOINT arguments
```Dockerfile
# good (exec form as defaults params)
CMD ["param1","param2"] (as default parameters to ENTRYPOINT)

# bad (shell form)
CMD command param1 param2
```