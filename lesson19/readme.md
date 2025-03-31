1 bash-completion
	test@less4:~/less19$ sudo apt install bash-completion
	test@less4:~/less19$ source <(kubectl completion bash)
	test@less4:~/less19$ echo "source <(kubectl completion bash)" >> ~/.bashrc


2.1 minikube
	test@less4:~/less19$ kubectl cluster-info
	Kubernetes control plane is running at https://192.168.49.2:8443
	CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

	To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

2.2 kind
	test@less4:~/less19$ kubectl cluster-info
	Kubernetes control plane is running at https://192.168.49.2:8443
	CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

	To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.


3 namespace

	test@less4:~/less19$ kubectl create namespace codeby
	namespace/codeby created
	test@less4:~/less19$ kubectl config set-context --current --namespace=codeby
	Context "minikube" modified.
	test@less4:~/less19$ kubectl get namespace
	NAME              STATUS   AGE
	codeby            Active   13s
	default           Active   106m
	kube-node-lease   Active   106m
	kube-public       Active   106m
	kube-system       Active   106m


