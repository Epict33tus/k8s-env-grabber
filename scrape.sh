#!/bin/zsh
#pod_names=("${(@f)$(kubectl get pods --all-namespaces -o custom-columns=":metadata.name" --no-headers --sort-by=.metadata.name)}")
pod_names=($(kubectl get pods --all-namespaces -o custom-columns=":metadata.name" --no-headers --sort-by=.metadata.name))
pod_ns=($(kubectl get pods --all-namespaces -o custom-columns=":metadata.namespace" --no-headers --sort-by=.metadata.name))
for ((i = 1; i <= $#pod_names; i++)); do \
  #echo "here: ${pod_ns[$i]} ${pod_names[$i]}"
  # kubectl get pod -n "${pod_ns[$i]}" "${pod_names[$i]}" \
 {
  kubectl exec -it -n "${pod_ns[$i]}" "${pod_names[$i]}" -- /bin/sh -c env || \
  kubectl exec -it -n "${pod_ns[$i]}" ${pod_names[$i]}" -- /bin/bash -c env || \
  kubectl exec -it -n "${pod_ns[$i]}" ${pod_names[$i]}" -- /bin/zsh -c env \
 } || {}
  #echo $i
;done

