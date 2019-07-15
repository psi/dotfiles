# This seems to be causing me enough grief these days.
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

VAGRANT_PKG_DIR="/Applications/Vagrant"

if [ -d ${VAGRANT_PKG_DIR} ]; then
  # Always use vagrant from the installed package
  alias vagrant="/usr/bin/vagrant"

  # Install bundled gems into the packaged Vagrant
  alias vagrant-bundle="${VAGRANT_PKG_DIR}/embedded/bin/bundle"
fi
