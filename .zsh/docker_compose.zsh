function drake() {
  service=$(basename ${PWD})
  docker-compose run ${service} rake $@
}

function _docker-compose() {
  if [ "$DOCKER_HOST" = "" ]; then
    echo "Initializing Docker env..."
    dinghy-shell-init
  fi

  docker-compose $@
}

alias docker-compose=_docker-compose
