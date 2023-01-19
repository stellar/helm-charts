# Stellar Core Helm Chart

Please note that this chart is not complete yet and should not be used for production deployments.

The chart can deploy stellar-core

## Usage

Default parameters should be fine for dev environments in testnet.

Add SDF helm repo to your system:
```
helm repo add stellar https://helm.stellar.org/charts
```
For example to render manifests you can use the following command:
```
helm install mycore stellar/core
```

## Example:
You can deploy futurenet watcher using `futurenet-values.yaml` config file:

```
helm install mycore stellar/core --values=futurenet-values.yaml

```

## TODO

