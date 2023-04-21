#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

bash ns-scale.sh dump mpoc-dev sts
bash ns-scale.sh dump mpoc-dev deploy
bash ns-scale.sh dump mpoc-dev-bff sts
bash ns-scale.sh dump mpoc-dev-bff deploy
bash ns-scale.sh dump mpoc-dev-cor sts
bash ns-scale.sh dump mpoc-dev-cor deploy

bash ns-scale.sh set mpoc-dev sts 0
bash ns-scale.sh set mpoc-dev deploy 0
bash ns-scale.sh set mpoc-dev-bff sts 0
bash ns-scale.sh set mpoc-dev-bff deploy 0
bash ns-scale.sh set mpoc-dev-cor sts 0
bash ns-scale.sh set mpoc-dev-cor deploy 0
