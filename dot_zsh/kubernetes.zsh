function kube-decode-secret() {
  secret=$1
  namespace=${2:=default}

  kubectl get -n ${namespace} secrets/${secret} -o yaml \
    | yaml2json \
    | jq '.data | to_entries | map( {(.key) : (.value | @base64d) } ) | add'
}
