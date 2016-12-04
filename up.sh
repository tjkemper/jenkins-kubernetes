
# variables
APP=jenkins
NAMESPACE=operations


# namespace
kubectl apply -f namespaces/$NAMESPACE.yaml

# nginx ingress controller
kubectl apply -f ingress/nginx/configmap.yaml
kubectl apply -f ingress/nginx/default-service.yaml
kubectl apply -f ingress/nginx/default-deployment.yaml
kubectl apply -f ingress/nginx/service.yaml
kubectl apply -f ingress/nginx/deployment.yaml

# secret
kubectl create secret generic kubeconfig --from-file=./kubeconfig --namespace $NAMESPACE

# service
kubectl apply -f services/$APP.yaml --namespace $NAMESPACE

# deployment
kubectl apply -f deployments/$APP.yaml --namespace $NAMESPACE

# ingress
kubectl apply -f ingress/$APP.yaml

