#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# backup
helm3 get values aws-ebs-csi-driver -n kube-system > backup/aws-ebs-csi-driver-values.yaml

# uninstall chart
helm3 uninstall aws-ebs-csi-driver -n kube-system

sleep 10

# install new version chart
RELEASE_VERSION=2.16.0

helm3 repo add cloudzcp ${HELM_REPOSITORY} --username ${REGISTRY_USERNAME} --password ${REGISTRY_PASSWORD}

helm3 upgrade -i aws-ebs-csi-driver cloudzcp/aws-ebs-csi-driver \
--version ${RELEASE_VERSION} \
--namespace kube-system \
-f aws-ebs-csi-driver/values-sc.yaml \
--set controller.serviceAccount.create=false \
--set node.serviceAccount.create=false \
--set node.tolerateAllTaints=true \
