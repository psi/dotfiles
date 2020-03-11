eval "$(kubectl completion zsh)"

alias k='kubectl'

function kube-decode-secret() {
  secret=$1
  namespace=${2:=default}

  kubectl get -n ${namespace} secrets/${secret} -o yaml \
    | yaml2json \
    | jq '.data | to_entries | map( {(.key) : (.value | @base64d) } ) | add'
}

# Stolen from https://www.nrmitchi.com/2019/01/managing-kubeconfig-files/
function set-kubeconfig {
  # Sets the KUBECONFIG environment variable to a dynamic concatentation of everything
  # under ~/.kube/conf.d/*
  # Does NOT overwrite KUBECONFIG if the KUBECONFIG_MANUAL env var is set

  if [ -d ~/.kube/conf.d ]; then
    if [ -z "$KUBECONFIG_MANUAL" ]; then
      export KUBECONFIG=~/.kube/config$(find ~/.kube/conf.d -type f 2>/dev/null | xargs -I % echo -n ":%")
    fi
  fi

  if [ -d ~/.config/k3d ]; then
    # Force writing of kubeconfigs for newly created clusters
    # TODO: This only needs to run when I create a cluster
    k3d get-kubeconfig --all &>/dev/null

    if [ -z "$KUBECONFIG_MANUAL" ]; then
      export KUBECONFIG=${KUBECONFIG}$(find ~/.config/k3d -type f -name 'kubeconfig.yaml' 2>/dev/null | xargs -I % echo -n ":%")
    fi
  fi
}

add-zsh-hook precmd set-kubeconfig

function kube-get-context() {
  echo "$(kubectx -c)/$(kubens -c)"
}

function kube-shell() {
  kubectl run --generator=run-pod/v1 shell-$(whoami)-$(random-id) --image-pull-policy="Always" --labels app=toolbox --rm -i --tty --image jdharrington/toolbox $@ -- /bin/bash
}

# This lets octant work with my munged together KUBECONFIG env variable
alias octant="octant --kubeconfig ${HOME}/.kube/conf.d/$(kubectl config current-context).yaml"
