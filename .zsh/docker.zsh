function dinghy-shell-init() {
  # Allow per-project machines with DOCKER_MACHINE env variable
  #machine_name=${DOCKER_MACHINE:-docker}

  if ! dinghy status | grep VM: | grep -q running; then
    dinghy up
  fi

  eval $(dinghy shellinit 2>/dev/null)
}

function docker-machine-create() {
  machine_name=${DOCKER_MACHINE:-docker}

  docker-machine create \
    --driver vmwarefusion \
    --vmwarefusion-memory-size 4096 \
    --vmwarefusion-disk-size 20000 \
    --vmwarefusion-cpu-count 2 \
    ${machine_name}
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
    dinghy-shell-init
  fi

  docker $@
}

alias docker=_docker
