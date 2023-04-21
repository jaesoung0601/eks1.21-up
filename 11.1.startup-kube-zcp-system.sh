#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

bash ns-scale.sh load kube-system sts 
bash ns-scale.sh load kube-system deploy

bash ns-scale.sh load zcp-system sts 
bash ns-scale.sh load zcp-system deploy
