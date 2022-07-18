# helm-charts

This repository contains the following Helm charts for deploying SDF maintained software:
- Anchor Platform SEP Service

# Anchor Platform SEP Service
Documentation
https://github.com/stellar/java-stellar-anchor-sdk/tree/main/docs

## Add Repository (stable)
```
$ helm repo add sdf-stable https://helm.sdf.org/stable
$ helm repo update
```

## Add Repository (edge/experimental)
```
$ helm repo add sdf-edge https://helm.sdf.org/edge
$ helm repo update
```

## Install Packages (stable)
```
$ helm repo add sdf-stable https://helm.sdf.org/stable
$ helm repo update
```
## Install Packages (edge/experimental)
```
$ helm install my-release sdf-edge/sep [--version 0.3.83]
```

## Install Packages (stable)
Note, Stable packages are not availabel yet.