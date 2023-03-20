## Create your Own Apache Airflow

# 1. Start configurations

1. Install helm in your local machine
2. Create a kubernetes cluster in GKE

    2.1. Main-node-pool: at least 2cpu and 8GB

    2.2. Worker-node-pool: could be bigger than the main node pool

        2.2.1. Include tag: node-airflow: worker
        2.2.2. Include taint: only:workers - NoSchedule

3. Set your personal values in `values.yaml`

    3.1.  webserverSecretKey: create a random secret

        python3 -c 'import secrets; print(secrets.token_hex(16))'

    3.2. Set your domain for your webserver UI domain:

        Replace the `mywebpage.com` value in the web-ingress.yaml

    3.3. Create an A record in you CDN with the IP of the NGIX ingress service.

    3.4. See the NGINX ingress:

        kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

# Install Helm package

1. Install nginx in your cluster
2. Install cert-manager
2. Install helm airflow
3. Apply ingress
4. Update your A record in your CDN
5. Apply cert Issues for production or stage
6. Start working with your Domain
7. Update the gitRepo with yours
