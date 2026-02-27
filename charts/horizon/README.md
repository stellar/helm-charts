# Stellar Horizon Helm Chart

The chart can deploy ingesting horizon pod and, optionally, dedicated non-ingesting pod(s).
By default horizon will be connected to the TESTNET network.

## Usage

Default parameters should be fine for dev environments in testnet.
The only setting that needs to be provided is `ingest.existingSecret` which should point to a pre-existing
secret that contains the `DATABASE_URL` string.

## Deploying PostgreSQL with CloudNativePG

You can deploy PostgreSQL together with Horizon by enabling optional CloudNativePG resources.
When `cnpg.enabled=true` and `ingest.existingSecret` / `web.existingSecret` are not set,
this chart generates a secret with `DATABASE_URL` and injects it into Horizon pods.

Example:
```
helm install myhorizon stellar/horizon \
  --set cnpg.enabled=true \
  --set cnpg.auth.password=change-me
```

Notes:
- CloudNativePG operator and CRDs must already be installed in the cluster.
- `cnpg.auth.password` is required for auto-generated `DATABASE_URL`.
- You can still use external DB credentials by setting `ingest.existingSecret` and/or `web.existingSecret`.

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
* Use dedicated core service for TX submission. This will allow
  us to have multiple ingesting intances but route all TX to a single core
