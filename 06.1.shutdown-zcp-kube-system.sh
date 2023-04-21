#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

bash ns-scale.sh dump zcp-system sts
bash ns-scale.sh dump zcp-system deploy
bash ns-scale.sh dump kube-system sts
bash ns-scale.sh dump kube-system deploy

bash ns-scale.sh set zcp-system sts 0
bash ns-scale.sh set zcp-system deploy 0
bash ns-scale.sh set kube-system sts 0
bash ns-scale.sh set kube-system deploy 0
