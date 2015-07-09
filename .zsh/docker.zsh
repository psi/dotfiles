function b2d-shell-init() {
  if ! boot2docker status | grep -q running; then
    boot2docker start
  fi

  eval $(boot2docker shellinit docker 2>/dev/null)
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
    b2d-shell-init
  fi

  docker $@
}

alias docker=_docker
