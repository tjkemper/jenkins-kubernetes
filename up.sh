
# variables
APP=jenkins
NAMESPACE=operations


# secret
kubectl create secret generic kubeconfig --from-file=./config --namespace $NAMESPACE

# service
kubectl apply -f services/$APP.yaml --namespace $NAMESPACE

# deployment
kubectl apply -f deployments/$APP.yaml --namespace $NAMESPACE

# ingress
kubectl apply -f ingress/$APP.yaml

