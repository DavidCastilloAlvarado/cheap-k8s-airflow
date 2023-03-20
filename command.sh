## Install airflow


## Intall Airflow using Helm

# Get values
helm show values apache-airflow/airflow > globalcustomvalue.yaml
##### https://airflow.apache.org/docs/helm-chart/stable/index.html
##### https://helm.sh/docs/intro/using_helm/
# Install airflow in cluster
helm repo add apache-airflow https://airflow.apache.org
# Install using cusom values.yaml file
helm install airflow -f values.yaml apache-airflow/airflow --namespace airflow --create-namespace
# If you already have the helm installed you need to update using the current calues
helm upgrade -f current-val.yaml airflow apache-airflow/airflow --wait



##### https://cert-manager.io/docs/installation/kubectl/
# Install Cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
# grant permissions on GKE
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)

##### https://kubernetes.github.io/ingress-nginx/deploy/
# Install NGINX
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.6.4/deploy/static/provider/cloud/deploy.yaml
# Verify ip
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80


# Install Ingress and create cert
kubectl apply -f web-ingress.yaml -n airflow
kubectl apply -f ./cert/clusterissuer.yaml -n airflow