#!/bin/bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml
helm repo add cert-manager https://charts.jetstack.io
helm repo update
helm install \
  cert-manager \
  cert-manager/cert-manager \
  --namespace apps \
  --version v1.10.1
