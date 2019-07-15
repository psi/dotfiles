function join-lines() {
  sed s/$/\\\\n/ | tr -d '\n'
}
