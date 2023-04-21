#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

eksctl upgrade nodegroup \
--cluster ${CLUSTER_NAME} \
--name ${NODEGROUP_NAME} \
--profile ${AWS_PROFILE} \
--kubernetes-version 1.22 \
--force-upgrade \
-v 5
