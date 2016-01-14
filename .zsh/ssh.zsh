function ssh_ec2_instance_id() {
  ssh $(ec2_ip_for_instance $1)
}

function _ssh() {
  if [[ "$1" =~ "^i-[a-z0-9]{8,17}" ]]; then
    ssh_ec2_instance_id $1
  else
    /usr/bin/ssh $@
  fi
}

alias ssh=_ssh
