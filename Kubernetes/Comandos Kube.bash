Container Gerencia bem parar subdividir os recursos isoladamente.
Namespace - 
cgroups   - 

Spinnaker - CI/CD


CIS
https://www.cisecurity.org/

Ferramentas de Scanner de Container

ANCHORE
CLAIR
DOCKER BENCH FOR SECURITY
SYSDIG FALCO
SCANNER FOR ECR - AWS

Kube bench


--------- ARQUITETURA ----------------
#	MASTER	#
Kubeadm		- Ferramenta usada na instalação do Cluster
Kubelet 	- Componente/Agente de casa Nóde intermediando entre API Server e Docker runtime.
Kubectl		- CLI K8s
Docker		-
Control Plane -

#	WORKER	#
Kubeadm		-
Kubelet		-
Kubectl		-
Docker		-


##   Elementos do Cluster   ##


KUBE-Controler Manager	- Controladores Monitorando e toma ações de acodo com o que está sendo monitorando. (Caso algum pode morra, ele vai tomar uma ação de criar outro pod).
Cloud Manager		-
KUBE-API			- Gerencia a Comunicação (Baseada em REST) Recebe requisições em JSON.
ETCD				- Gerencia a base de dados "chave - valor" (Armazena Dados de Configuracao, estado Cluster, status pod)  Kubernetes roda um pode com o ETCD entro.
KUBE-SCHEDULER			- Escalar os pods Obs.: Impor limites!
KUBE-Proxy 			- Trata a comunicação dos pods. (Redirecionamentos, Cria tuneis de comunicação criptografado para que mais ninguém(outras Maquinas) entenda essa comunicação)

Kubelet
	- Gerencia "Container Runtime"
	- 
# REDE #
Rede virtuais, cada Pod tem um endereço IP mesmo em nós diferentes.
	Plugins:
			- Flannel -
			- Weave	  -
	
# Tipo De Objetos #

Pod
ReplicaSets
Services
DaemonSet
Jobs
Ingress
ConfigMaps
Pod Distribution buget...



-------------- COMANDOS ------------------
https://kubernetes.io/pt/docs/reference/kubectl/cheatsheet/
------ CREATE -------

kubectl create namespace operacoes
kubectl create namespace pod

------ GET -------

## Listar Meus nós ##
kubectl get nodes

## Lista Meus Namespace ##
kubectl get namespaces

- Interagir com todos os namespaces usar flag

## Listar Meus Pods ##
kubectl get pods

ou

kubectl get pods --all-namespaces

## Lista Meus services ##
kubectl get services

## Listar Pods do Namespace Informado ##
kubectl get pods -n ID_NAMESPACE

## Listar ReplicaSets do Namespace Informado ##
kubectl -n ID_NAMESPACE get replicaset
ou 
kubectl -n ID_NAMESPACE get rs

----- LABELS ----

# Listar 
kubectl get pods --show-labels

# Deletar
kubectl delete pods -l environment=production,tier=frontend  
kubectl get pods -l environment in (production),tier in (frontend)


Obs. Pode colocar condição do namespace deejado
#Atribuir
kubectl label deployment nginx-deployment tier=dev


----- DESCRIBE ------

## Inspeciona o Pods ##
kubectl describe pod ID_POD 
## Inspeciona o Services ##
kubectl describe service ID_SERVICE

## Inspeciona o Namespace ##
kubectl describe nodes -n ID_NAMESPACE

## Lista Podes e Nos em que estão rodando ##
kubectl -n playground get pods -o wide  

## Inspeciona o Pods do Namespace ##
kubectl describe pod ID_POD -n ID_NAMESPACE



------ DELETE -----

## Deletar Namespace
ku delete namespace ID_NAMESPACE

## Deletar Pods / Service / Container
kubectl -n ID_NAMESPACE delete replicas	ID_POD (nginx-rs-chz87)
ou 
kubectl -n playground delete -f ./Pods/playground-nginx-pod.yaml

## Deletar Replica ##
kubectl -n ID_NAMESPACE delete replicas	ID_REPLICA (nginx-dep-64fc4c755d)
kubectl -n playground delete rs nginx-dep-64fc4c755d


Outros 

# Obter comandos com saída simples
kubectl get services                          # Listar todos os serviços do namespace
kubectl get pods --all-namespaces             # Listar todos os pods em todos namespaces
kubectl get pods -o wide                      # Listar todos os pods no namespace atual, com mais detalhes
kubectl get deployment my-dep                 # Listar um deployment específico
kubectl get pods                              # Listar todos os pods no namespace
kubectl get pod my-pod -o yaml                # Obter o YAML de um pod

# Descrever comandos com saída detalhada
kubectl describe nodes my-node
kubectl describe pods my-pod

# Listar serviços classificados por nome
kubectl get services --sort-by=.metadata.name

# Listar pods classificados por contagem de reinicializações
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# Listar PersistentVolumes classificado por capacidade
kubectl get pv --sort-by=.spec.capacity.storage

# Obtenha a versão da label de todos os pods com a label app=cassandra
kubectl get pods --selector=app=cassandra -o \
  jsonpath='{.items[*].metadata.labels.version}'

# Obter todos os nós workers (use um seletor para excluir resultados que possuem uma label
# nomeado 'node-role.kubernetes.io/master')
kubectl get node --selector='!node-role.kubernetes.io/master'

# Obter todos os pods em execução no namespace
kubectl get pods --field-selector=status.phase=Running

# Obter ExternalIPs de todos os nós
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'

# Listar nomes de pods pertencentes a um RC particular 
# O comando "jq" é útil para transformações que são muito complexas para jsonpath, pode ser encontrado em https://stedolan.github.io/jq/
sel=${$(kubectl get rc my-rc --output=json | jq -j '.spec.selector | to_entries | .[] | "\(.key)=\(.value),"')%?}
echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})

# Mostrar marcadores para todos os pods(ou qualquer outro objeto Kubernetes que suporte rotulagem)
kubectl get pods --show-labels

# Verifique quais nós estão prontos
JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \
 && kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True"

# Listar todos os segredos atualmente em uso por um pod
kubectl get pods -o json | jq '.items[].spec.containers[].env[]?.valueFrom.secretKeyRef.name' | grep -v null | sort | uniq

# Listar todos os containerIDs de initContainer de todos os pods
# Útil ao limpar contêineres parados, evitando a remoção de initContainers.
kubectl get pods --all-namespaces -o jsonpath='{range .items[*].status.initContainerStatuses[*]}{.containerID}{"\n"}{end}' | cut -d/ -f3

# Listar eventos classificados por timestamp
kubectl get events --sort-by=.metadata.creationTimestamp

# Compara o estado atual do cluster com o estado em que o cluster estaria se o manifesto fosse aplicado.
kubectl diff -f ./my-manifest.yaml

------ LOG --------

## Mostar log do Pods ##
kubectl -n ID_NAMESPACE log ID_POD
 
 
# Kubectl e Tipos de Interações #

Kubectl Create
Kubectl Run
Kubectl Scale
Kubectl Expose
Kubectl Exec
Kubectl Copy
Kubectl Logs


------ Exportar/Pegar Arquivo yaml -------
# Completa
kubectl get pod ID_POD -o yaml > nome_arquivo.yaml

ou

# Simplificada
kubectl get pod ID_POD -o yaml --export > nome_arquivo.yaml


----------------- LABELS ----------------------
Tags usadas para rotular os objetos, 
podem ser usada para realizar filtros para consultar.

Existem 2 tipos:

1º # Equality-based-requirement
environment = production
tier != frontend

2º Set=based-requirement
environment in (production, qa)
tier notin (frontend,backend)

_________________________________

Escalabilidade 

HPA - Verifica metricas

Obs.: Não armazenas, devem usar outras ferramentas para ler a API e armazenas as metricas. (METRICS SERVER)



-------------------------

Instalação:
Instalar docker em todos os Nodes.
Veriicar Compatibilidade de versão do docker com o kubernets.
Impedir que o docker se atualize automaticamente.
Criar o daemon; /etc/docker/daemon.json
Configurar o daemon(criar arquivo).
mkdir -p /etc/systemd/system/docker;service.d
Reiniciar o daemon.
Reiniciar o docker
verificar versão instalada.

Instalaçao do Cluster:
Adcionar repositorio do Kube
sudo tee /etc/apt/souces.list.d/kubernetes.list .....
Listar versão dos pacotes kubernetes
Instalar: kubectl, kubeadm, kubernet
Impedir atualizações das ferramentas listadas

Desabilitar o Swap permanentemente dos Nodes/VM
Atualizar o fstab para que quando reinicar não retorne o Swap





--------------------


helm

I ve seen this when there is a failed release

helm list --all-namespaces -d 

helm delete -n namespace APPNAME

helm del --purge APPNAME






