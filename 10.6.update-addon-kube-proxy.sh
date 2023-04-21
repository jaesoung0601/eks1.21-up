#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

eksctl get addons --cluster ${CLUSTER_NAME} --profile ${AWS_PROFILE}

KUBE_PROXY_VERSION=

# Check the filesystem id exist
if [ "x${KUBE_PROXY_VERSION}" != "x" ]
then
    echo "Kube Proxy Version is ${KUBE_PROXY_VERSION}"
else
    echo ">>> Kube Proxy Version is empty!!!"
    exit
fi

eksctl update addon \
--name kube-proxy \
--version ${KUBE_PROXY_VERSION} \
--cluster ${CLUSTER_NAME} \
--profile ${AWS_PROFILE} \
--force