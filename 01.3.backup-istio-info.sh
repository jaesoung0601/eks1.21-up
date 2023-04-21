#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# istio backup
kubectl get istiooperators.install.istio.io istio-controlplane-dev -o yaml > backup/istio-controlplane-dev.yaml
# kubectl get istiooperators.install.istio.io istio-controlplane-stg -o yaml > backup/istio-controlplane-stg.yaml
# kubectl get istiooperators.install.istio.io istio-controlplane-prd -o yaml > backup/istio-controlplane-prd.yaml

# istio svc backup
kubectl get svc -n istio-system -o yaml istio-ingressgateway > backup/istio-ingressgateway.yaml
NLB_HOSTNAME=$(kubectl get svc -n istio-system -o json istio-ingressgateway | jq -r '.status.loadBalancer.ingress[0].hostname')
nslookup ${NLB_HOSTNAME} > backup/istio-ingressgateway-nslookup.log

# for mpoc stg/prd
# kubectl get svc -n istio-system -o yaml istio-ingressgateway-pocadmin > backup/istio-ingressgateway-pocadmin.yaml
# POCADMIN_NLB_HOSTNAME=$(kubectl get svc -n istio-system -o json istio-ingressgateway-pocadmin | jq -r '.status.loadBalancer.ingress[0].hostname')
# nslookup ${POCADMIN_NLB_HOSTNAME} > backup/istio-ingressgateway-pocadmin-nslookup.log

# for mpoc prd
# kubectl get svc -n istio-system -o yaml istio-ingressgateway-osms > backup/istio-ingressgateway-osms.yaml
# OSMS_NLB_HOSTNAME=$(kubectl get svc -n istio-system -o json istio-ingressgateway-osms | jq -r '.status.loadBalancer.ingress[0].hostname')
# nslookup ${OSMS_NLB_HOSTNAME} > backup/istio-ingressgateway-osms-nslookup.log

