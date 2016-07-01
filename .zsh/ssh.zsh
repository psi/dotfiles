function ssh_ec2_instance_id() {
  if [[ "$1" =~ "@" ]]; then
    user=${1[(ws:@:)1]}
    host=${1[(ws:@:)2]}
  else
    user=$(whoami)
    host=$1
  fi

  shift

  ssh ${user}@$(ec2_ip_for_instance $host) $@
}

function _ssh() {
  if [[ "$1" =~ "i-[a-z0-9]{8,17}" ]]; then
    ssh_ec2_instance_id $@
  else
    /usr/bin/ssh $@
  fi
}

alias ssh=_ssh
