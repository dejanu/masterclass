### Apps

```bash
# 2 apps
docker run -p 5555:5555 dejanualex/python_hello:1.0
docker run -p 8888:8888 dejanualex/go_hello:1.0

# 2 deployments
kubectl create deployment pythonapp --image=dejanualex/python_hello:1.0 --replicas=2
kubectl create deployment goapp --image=dejanualex/go_hello:1.0 --replicas=2

# 2 services
kubectl expose deployment pythonapp --name=pythonapp-svc --port=8081 --target-port=5555
kubectl expose deployment goapp --name=goapp-svc --port=8082 --target-port=8888

# naked pod with curl 
kubectl  run curlopenssl -i --tty --image=dejanualex/curlopenssl:1.0  -- sh
curl pythonapp-svc.default.svc.cluster.local:8081
curl goapp-svc.default.svc.cluster.local:8082
```

## Services

```bash
# dns for services
 Services are assigned DNS A and/or AAAA records, depending on the IP family or families of the Service, with a name of the form my-svc.my-namespace.svc.cluster-domain.example. 
 This resolves to the cluster IP of the Service.
<namespace>.svc.cluster.local svc.cluster.local cluster.local

# Service discovery
DNS (my-svc.my-namespace.svc.cluster.local)
my-svc.my-namespace.svc.cluster-domain.example
```

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

