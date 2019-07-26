function join-lines() {
  sed s/$/\\\\n/ | tr -d '\n'
}

function random-id() {
  openssl rand -base64 8 | md5 | head -c8
}
