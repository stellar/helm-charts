# Galexie Helm Chart

A helm chart for installing [Galexie](https://github.com/stellar/stellar-galexie) into a Kubernetes cluster.

## Installing the Chart

In order to install the chart into a target Kubernetes cluster run the following commands

```
helm repo add stellar https://helm.stellar.org/charts && helm repo update

helm install my-galexie stellar/galexie
```

## Dependencies

1. A datasource bucket to push ledger data from Galexie. This can be either an S3 bucket or GCS bucket
