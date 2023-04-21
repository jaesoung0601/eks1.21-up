#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

eksctl get addons --cluster ${CLUSTER_NAME} --profile ${AWS_PROFILE}

COREDNS_VERSION=

# Check the filesystem id exist
if [ "x${COREDNS_VERSION}" != "x" ]
then
    echo "CoreDNS Version is ${COREDNS_VERSION}"
else
    echo ">>> CoreDNS Version is empty!!!"
    exit
fi

eksctl update addon \
--name coredns \
--version ${COREDNS_VERSION} \
--cluster ${CLUSTER_NAME} \
--profile ${AWS_PROFILE} \
--force