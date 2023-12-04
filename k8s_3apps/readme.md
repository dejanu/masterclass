

### Apps

* go app

```bash
docker run -p 8888:8888 dejanualex/go_hello:1.0
kubectl run app1 --image=dejanualex/go_hello:1.0 --port=8888


# create svc
kubectl expose pod app1 --name=app1-svc --port=8888 --target-port=8888
```