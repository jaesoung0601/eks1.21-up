#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}


eksctl scale nodegroup \
--cluster ${CLUSTER_NAME} \
--name ${NODEGROUP_NAME} \
--profile ${AWS_PROFILE} \
--nodes 3 \
--nodes-max 3 \
--nodes-min 3 \
-v 5

kubectl label nodes -l alpha.eksctl.io/nodegroup-name=skb-share-control-eks-mgmt-16-64 node-role.kubernetes.io/edge=edge
kubectl label nodes -l alpha.eksctl.io/nodegroup-name=skb-share-control-eks-mgmt-16-64 node-role.kubernetes.io/logging=logging
kubectl label nodes -l alpha.eksctl.io/nodegroup-name=skb-share-control-eks-mgmt-16-64 node-role.kubernetes.io/management=management
kubectl label nodes -l alpha.eksctl.io/nodegroup-name=skb-share-control-eks-mgmt-16-64 node-role.kubernetes.io/monitoring=monitoring
kubectl label nodes -l alpha.eksctl.io/nodegroup-name=skb-share-control-eks-mgmt-16-64 role=management