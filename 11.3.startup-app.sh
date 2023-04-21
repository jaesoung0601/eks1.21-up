#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

bash ns-scale.sh load mpoc-dev sts 
bash ns-scale.sh load mpoc-dev deploy
bash ns-scale.sh load mpoc-dev-bff deploy
bash ns-scale.sh load mpoc-dev-bff sts
bash ns-scale.sh load mpoc-dev-cor deploy
bash ns-scale.sh load mpoc-dev-cor sts

