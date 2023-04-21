#!/bin/bash

. ./env.properties

export KUBECONFIG=${KUBE_CONFIG}

# for test
velero backup create --from-schedule all-daily