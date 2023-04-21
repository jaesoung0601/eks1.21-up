#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# backup
helm3 get values aws-efs-csi-driver -n kube-system > backup/aws-efs-csi-driver-values.yaml

ZCP_FILE_SYSTEM_ID=$(helm3 get values aws-efs-csi-driver -n kube-system -o json | jq -r '.storageClasses[0].parameters.fileSystemId')

# Check the filesystem id exist
if [ "x${ZCP_FILE_SYSTEM_ID}" != "x" ]
then
    echo "EFS filesystem id is ${ZCP_FILE_SYSTEM_ID}"
else
    echo ">>> EFS filesystemid is empty!!!"
    exit
fi

# upgrade new chart
RELEASE_VERSION=2.3.7

helm3 upgrade -i aws-efs-csi-driver cloudzcp/aws-efs-csi-driver \
--version ${RELEASE_VERSION} \
--namespace kube-system \
-f aws-efs-csi-driver/values-sc.yaml \
--set controller.serviceAccount.create=false \
--set node.serviceAccount.create=false \
--set storageClasses[0].parameters.fileSystemId=${ZCP_FILE_SYSTEM_ID} \
--set storageClasses[1].parameters.fileSystemId=${ZCP_FILE_SYSTEM_ID} \
