#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

eksctl get addons --cluster ${CLUSTER_NAME} --profile ${AWS_PROFILE}

VPC_CNI_VERSION=

# Check the filesystem id exist
if [ "x${VPC_CNI_VERSION}" != "x" ]
then
    echo "VPC CNI Version is ${VPC_CNI_VERSION}"
else
    echo ">>> VPC CNI Version is empty!!!"
    exit
fi

eksctl update addon \
--name vpc-cni \
--version ${VPC_CNI_VERSION} \
--cluster ${CLUSTER_NAME} \
--profile ${AWS_PROFILE} \
--force