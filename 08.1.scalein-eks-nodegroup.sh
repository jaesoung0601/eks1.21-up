#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}


eksctl scale nodegroup \
--cluster ${CLUSTER_NAME} \
--name ${NODEGROUP_NAME} \
--profile ${AWS_PROFILE} \
--nodes 0 \
--nodes-max 0 \
--nodes-min 0 \
-v 5