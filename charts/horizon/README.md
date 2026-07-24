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

Example using an existing CNPG bootstrap secret:
```
helm install myhorizon stellar/horizon \
  --set cnpg.enabled=true \
  --set cnpg.cluster.spec.bootstrap.initdb.database=horizon \
  --set cnpg.cluster.spec.bootstrap.initdb.owner=horizon \
  --set cnpg.cluster.spec.bootstrap.initdb.secret.name=cnpg-db-creds \
  --set ingest.existingSecret=horizon-db-url
```

Notes:
- CloudNativePG operator and CRDs must already be installed in the cluster.
- `cnpg.auth.password` is required only when this chart manages CNPG bootstrap credentials and/or generates the `DATABASE_URL` secret.
- `cnpg.auth.username` and `cnpg.auth.password` are mutually exclusive with `cnpg.cluster.spec.bootstrap.initdb.secret.name`.
- If you provide `cnpg.cluster.spec.bootstrap` (for example `bootstrap.initdb.secret.name`), chart-managed CNPG bootstrap credentials are skipped.
- Auto-generated `DATABASE_URL` still requires `cnpg.auth.password`; if it is not set, provide `ingest.existingSecret` and/or `web.existingSecret`.
- You can still use external DB credentials by setting `ingest.existingSecret` and/or `web.existingSecret`.
- Any field on the CNPG `Cluster.spec` (instances, storage, `enablePDB`, monitoring, backup, etc.) can be set under `cnpg.cluster.spec`. See `values.yaml` for details.

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
