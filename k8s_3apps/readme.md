

### Apps

* go app

```bash
docker run -p 8888:8888 dejanualex/go_hello:1.0
kubectl run app1 --image=dejanualex/go_hello:1.0 --port=8888


# create svc
kubectl expose pod app1 --name=app1-svc --port=8888 --target-port=8888
```

### 2 Apps

```bash
# 2 apps

docker run -p 5555:5555 dejanualex/python_hello:1.0
docker run -p 8888:8888 dejanualex/go_hello:1.0

# 2 deployments
kubectl create deployment pythonapp --image=dejanualex/python_hello:1.0 --replicas=2
kubectl create deployment goapp --image=dejanualex/go_hello:1.0 --replicas=2


# dns for services
 Services are assigned DNS A and/or AAAA records, depending on the IP family or families of the Service, with a name of the form my-svc.my-namespace.svc.cluster-domain.example. 
 This resolves to the cluster IP of the Service.
<namespace>.svc.cluster.local svc.cluster.local cluster.local

# create services
kubectl expose deployment pythonapp --name=pythonapp-svc --port=8081 --target-port=5555
kubectl expose deployment goapp --name=goapp-svc --port=8082 --target-port=8888


# Service discovery
- DNS (my-svc.my-namespace.svc.cluster.local)

my-svc.my-namespace.svc.cluster-domain.example

# naked pod with curl 
kubectl  run curlopenssl -i --tty --image=dejanualex/curlopenssl:1.0  -- sh
pythonapp-svc.default.svc.cluster.local:8081
goapp-svc.default.svc.cluster.local:8082
```