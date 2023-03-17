# Stellar Horizon Helm Chart

The chart can deploy ingesting horizon pod and, optionally, dedicated non-ingesting pod(s).
By default horizon will be connected to the TESTNET network.

## Usage

Default parameters should be fine for dev environments in testnet.
The only setting that needs to be provided is `ingest.existingSecret` which should point to a pre-existing
secret that contains the `DATABASE_URL` string.

Add SDF helm repo to your system:
```
helm repo add stellar https://helm.stellar.org/charts
```
For example to render manifests you can use the following command:
```
helm install myhorizon stellar/horizon --set "ingest.existingSecret=horizon-db-secret"
```

## TODO

* Add ingress support
* Support in-k8s database for ingestion and web instances
* Use dedicated core service for TX submission. This will allow
  us to have multiple ingesting intances but route all TX to a single core
