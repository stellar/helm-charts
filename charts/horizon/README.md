# Stellar Horizon Helm Chart

This chart will deploy stellar-horizon. By default it will be connected to the TESTNET network

## Usage

Default parameters should be fine for dev environments in testnet.
The only setting that needs to be provided is `ingest.existingSecret` which should point to a pre-existing
secret that contains the `DATABASE_URL` string.

For example to render manifests you can use the followign command:
```
helm template --set "ingest.existingSecret=horizon-db-secret" myhorizon
```

## TODO

* Add ingress support
* Support in-k8s database for ingestion and web instances
* Use dedicated core service for TX submission. This will allow
  us to have multiple ingesting intances but route all TX to a single core
