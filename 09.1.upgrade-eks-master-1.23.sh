#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

eksctl upgrade cluster --name ${CLUSTER_NAME} --profile ${AWS_PROFILE} --approve -v 5
