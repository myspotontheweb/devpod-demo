#!/bin/sh

export TOKEN=$(sudo cat /var/run/secrets/kubernetes.io/serviceaccount/token)

kubectl config set-cluster in-cluster --server https://kubernetes.default.svc --insecure-skip-tls-verify=true
kubectl config set-credentials in-cluster --token $TOKEN
kubectl config set-context in-cluster --user in-cluster --cluster in-cluster --namespace $REMOTE_USER

kubectl config use-context in-cluster
