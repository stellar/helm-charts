# helm-charts

This repository contains the following Helm charts for deploying SDF maintained software:
- Anchor Platform SEP Service

# Anchor Platform SEP Service
Documentation
https://github.com/stellar/java-stellar-anchor-sdk/tree/main/docs

## Install Anchor Platform Packages (stable)
```
$ helm install -f myvalues.yaml anchorplatform ./stable/anchor-platform/sep-service
```
## Install Anchor Platform Packages (edge/experimental)
```
$ helm install -f myvalues.yaml anchorplatform ./edge/anchor-platform/sep-service
```

