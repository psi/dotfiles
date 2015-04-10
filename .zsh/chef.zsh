CHEF_PKG_DIR="/opt/chef"

if [ -d ${CHEF_PKG_DIR} ]; then
  # Always use packaged Chef binaries
  for command in ${CHEF_PKG_DIR}/bin/*; do
    command=$(basename ${command})
    alias ${command}=/usr/bin/${command}
  done

  alias chef-bundle="${CHEF_PKG_DIR}/embedded/bin/bundle"
fi

alias knuck="knife cookbook upload $@"
alias edb="knife data bag show $1 $2 --secret-file ~/.chef/encrypted_data_bag_secret"

alias kc="kitchen converge $@"
alias kd="kitchen destroy $@"
alias kdc="kitchen destroy $@ && kitchen converge $@"
alias kv="kitchen verify $@"
alias kl="kitchen list"

#eval "$(${HOME}/.chefvm/bin/chefvm init -)"
