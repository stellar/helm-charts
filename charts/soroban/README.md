# Stellar Soroban RPC Helm Chart

Please note that this chart is not complete yet and should not be used for production deployments.

The chart can deploy soroban rpc.

## Usage

Default parameters should be fine for dev environments in testnet.

Add SDF helm repo to your system:
```
helm repo add stellar https://helm.stellar.org/charts
```
For example to render manifests you can use the following command:
```
helm install myhorizon stellar/horizon --set "ingest.existingSecret=horizon-db-secret"
```

## TODO
