#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-apply.sh

logSummary(){
    echo ""
    echo "#####################################################"
    echo "Please find the below useful endpoints,"
    echo "Gateway - http://store.jhipstersample.nip.io"
    echo "Jaeger - http://jaeger.${ISTIO_SYSTEM}sample.nip.io"
    echo "Grafana - http://grafana.${ISTIO_SYSTEM}sample.nip.io"
    echo "Kiali - http://kiali.${ISTIO_SYSTEM}sample.nip.io"
    echo "#####################################################"
}

kubectl apply -f namespace.yml
kubectl label namespace jhipster istio-injection=enabled --overwrite=true
kubectl apply -f store/
kubectl apply -f invoice/
kubectl apply -f notification/
kubectl apply -f product/

kubectl apply -f istio/
logSummary
