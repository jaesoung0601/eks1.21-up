#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

RELEASE_VERSION=1.4.7

#helm3 repo add eks https://aws.github.io/eks-charts
# kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
# helm3 upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \

# v2-zcr repo add
helm3 repo add cloudzcp ${HELM_REPOSITORY} --username ${REGISTRY_USERNAME} --password ${REGISTRY_PASSWORD}

echo $RELEASE_VERSION

# v2-zcr install
helm3 upgrade -i aws-load-balancer-controller cloudzcp/aws-load-balancer-controller \
--version ${RELEASE_VERSION} \
--namespace kube-system \
-f aws-load-balancer-controller/values.yaml \
--set clusterName="${CLUSTER_NAME}" \
--set serviceAccount.create=false \
--set serviceAccount.name=albc-sa \
# --set image.repository=602401143452.dkr.ecr.${REGION}.amazonaws.com/amazon/aws-load-balancer-controller \
