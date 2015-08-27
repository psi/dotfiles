function docker-machine-shell-init() {
  # Allow per-project machines with DOCKER_MACHINE env variable
  machine_name=${DOCKER_MACHINE:-docker}

  if ! docker-machine status ${machine_name} | grep -q Running; then
    docker-machine start ${machine_name}
  fi

  eval $(docker-machine env ${machine_name} 2>/dev/null)
}

function docker-load-images() {
  for image in ~/.docker/images/*.tar.gz; do
    echo "Loading $(basename ${image})..."

    pv ${image} | gunzip | docker load
  done
}

function _docker() {
  if [ "$DOCKER_HOST" = "" ]; then
    echo "Initializing Docker env..."
    docker-machine-shell-init
  fi

  docker $@
}

alias docker=_docker
