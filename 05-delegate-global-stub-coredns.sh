source 00-common.sh

set -x

ISTIO_DNS_IP="$(kubectl -n istio-system get service istiocoredns -o jsonpath='{.spec.clusterIP}')"

kubectl apply -f <(cat 05x-coredns-global-stub.yaml | sed "s/ISTIO_DNS_IP/${ISTIO_DNS_IP}/")
