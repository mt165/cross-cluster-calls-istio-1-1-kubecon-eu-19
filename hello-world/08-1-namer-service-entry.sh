source 00-common.sh

set -x

kubectl apply -f <(cat 08x-namer-service-entry.yaml | sed "s/CLUSTER2_GW_ADDR/${CLUSTER2_GW_ADDR}/")
