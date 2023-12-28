.DEFAULT_GOAL := documentation

documentation:
	@echo "flex"
	@echo "dockerstuff"
	@echo "vanilla"
	@echo "startcontainer"
	@echo "imperative_deploy"
	@echo "imperative_safe"
	@echo "imperative_service"
	@echo "annotate"
	@echo "imperative_lbservice"
	@echo "curl_pod"
	@echo "expose_prom"
	@echo "port_forward_prom"
	@echo "clean"

flex:
	@echo "kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods | jq .items[].containers[].usage"

dockerstuff:
	@echo "docker system info --format \"{{ .Runtimes }}\" "
	@echo "docker system info --format \"{{ .DefaultRuntime }}\" "

vanilla:
	@echo "docker run --rm --name=sleep alpine sh -c \"echo sleeping&&sleep 10\""

startcontainer:
	@echo "docker run -p 8081:5000 dejanualex/encryptapi:1.0"

imperative_deploy:
	@echo "kubectl create deployment webapp --image=dejanualex/encryptapi:1.0 --replicas=2"

imperative_safe:
	@echo "kubectl create deployment webapp --image=dejanualex/encryptapi:1.0 --replicas=2 --dry-run=client -oyaml"

imperative_service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --port=5555 --target-port=5000"

annotate:
	@echo "kubectl annotate svc webapp-svc prometheus.io/scrape='true'"

imperative_lbservice:
	@echo "kubectl expose deploy webapp --name=lb-svc --type=\"LoadBalancer\" --port=8080 --target-port=5000"
curl_pod:
	@echo "kubectl run curlpod -i --tty --image=dejanualex/curlopenssl:1.0 --rm -- sh"
expose_prom:
	@echo "kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-svc-ext"

port_forward_prom:
	@echo "kubectl port-forward svc/prometheus-svc-ext 8088:80"

clean:
	kubectl delete deploy webapp&&kubectl delete svc webapp-svc lb-svc