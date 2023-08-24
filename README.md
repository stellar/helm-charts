# Stellar Development Helm Charts

This repository contains the following Helm charts for deploying SDF maintained software:
- Anchor Platform SEP Service
- Horizon API server

To add the repo to your system run:
```
helm repo add stellar https://helm.stellar.org/charts
```

# Anchor Platform SEP Service
Documentation
* https://github.com/stellar/java-stellar-anchor-sdk/tree/main/docs
* https://github.com/stellar/helm-charts/tree/main/charts/anchor-platform/sep-service

## Install Anchor Platform Helm Chart
```
$ helm install -f myvalues.yaml sep-service ./charts/anchor-platform/sep-service
```
## Uninstall Anchor Platform Helm Chart
```
$ helm uninstall sep-service 
```

# Horizon API server

See https://github.com/stellar/helm-charts/tree/main/charts/horizon

# Stellar Disbursement Platform

See [stellar-disbursement-platform README.md](./charts/stellar-disbursement-platform/README.md)