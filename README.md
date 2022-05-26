## RavenDB Helm Chart

This is a helm chart for setting up a RavenDB cluster. 

### Usage

```shell
helm repo add ravendb jeremy-morren.github.io/ravendb
helm repo update
helm install ravendb ravendb/ravendb -n db --create-namespace -f values.yaml
```

An ingress controller that supports tls passthrough is required.

A sample `values.yaml` is shown below.  View the full list of available values [here](ravendb/values.yaml).

```yaml
clusterSize: 3

#Provide the public URLs that the cluster is available at
hosts:
  '0':
    http: a.ravendb.example.com
    tcp: tcp-a.ravendb.example.com
  '1':
    http: b.ravendb.example.com
    tcp: tcp-b.ravendb.example.com
  '2':
    http: c.ravendb.example.com
    tcp: tcp-c.ravendb.example.com

ingress:
  annotations:
   kubernetes.io/ingress.class: haproxy
   kubernetes.io/cluster-issuer: letsencrypt
  tlsSecretName: "ravendb-tls"

storage:
  class: premium
  size: 100Gi

resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 1
    memory: 1Gi
```

