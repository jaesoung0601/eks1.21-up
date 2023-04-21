#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# node info
kubectl get nodes -L eks.amazoneaws.com/nodegroup -L failure-domain.beta.kubernetes.io/zone > backup/node-zone-info.log

# nodegroup info
eksctl get nodegroup --cluster ${CLUSTER_NAME} --profile ${AWS_PROFILE} > backup/nodegroup-info.log

# elasticsearch data node
kubectl get pv > backup/pv-info.log