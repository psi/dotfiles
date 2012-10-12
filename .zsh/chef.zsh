CHEF_PKG_DIR="/opt/chef"

if [ -d ${CHEF_PKG_DIR} ]; then
  # Always use packaged Chef binaries
  for command in ${CHEF_PKG_DIR}/bin/*; do
    alias ${command}=${CHEF_PKG_DIR}/bin/${command}
  done

  alias chef-bundle="#{CHEF_PKG_DIR}/embedded/bin/bundle"
fi

alias knuck="knife cookbook upload $@"
