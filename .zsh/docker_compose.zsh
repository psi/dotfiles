function drake() {
  service=$(basename ${PWD})
  docker-compose run ${service} rake $@
}
