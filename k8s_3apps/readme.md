## Apps

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
---

## Ingress

- Ingress manages manages external access to the services, it can provide load balancing, SSL termination and name-based virtual hosting.

- You will need to have in your cluster first and Ingress controller and only afterwards you can createa a Ingress resource. Ingress resources are used to expose HTTP and HTTPS routes from outside the cluster to services within the cluster. 
Traffic routing is controlled by rules defined on the Ingress resource.

- An Ingress controller is responsible for fulfilling the Ingress, usually with a load balancer, though it may also configure your edge router or additional frontends to help handle the traffic.

- **A ingress resource without a ingress controller has no effect.**

- Install Ingress controller on local cluster:
```bash
kubectl apply -f ingress_controller.yaml

namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created

```

- Ingress resource:

Pre-req:
```bash
# create deployment
kubectl create deployment demo --image=httpd --port=80

# create cluster svc for deployment
kubectl expose deployment demo
```
Create ingress resource:
```bash
# imperative
kubectl create ingress demo-localhost --class=nginx  --rule="localhost/*=demo:80"

# declarative
kubectl apply -f ingress_for_deployment.yaml
```
Test ingress setup:
```bash
# forward a local port to the ingress controller
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

# browser or curl
curl --resolve demo.localdev.me:8080:127.0.0.1 http://demo.localdev.me:8080
```

