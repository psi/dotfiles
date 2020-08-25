function docker-stop-all() {
  docker container stop $(docker container ls -aq)
}
