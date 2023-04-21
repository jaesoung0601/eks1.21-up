#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# delete istio control plane for dev
kubectl delete istiooperators.install.istio.io istio-controlplane-dev

# delete istio control plane for stg
# kubectl delete istiooperators.install.istio.io istio-controlplane-stg

# delete istio control plane for prd
# kubectl delete istiooperators.install.istio.io istio-controlplane-prd

# delete istio operator
istioctl operator remove