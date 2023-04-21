#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

bash ns-scale.sh set ${REALM_NAME}-system deploy 0
bash ns-scale.sh set ${REALM_NAME}-system sts 0
