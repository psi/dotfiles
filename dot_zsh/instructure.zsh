eval "$( command rapture shell-init )"
export VERUCA_DIR=${HOME}/src/ins/veruca

function vaulted-secrets() {
  VAULT=$1
  shift

  if [[ "$@" == "" ]]; then
    # Load all variables except VAULTED_*
    GREP_ARGS="-v VAULTED_"
  else
    GREP_ARGS=$(echo "$@" | perl -pe 's/\s/\n/g' | sed 's/^/-e "/' | sed 's/$/="/' | tr '\n' ' ')
  fi

  bash -c "vaulted env ${VAULT} | grep ${GREP_ARGS}"
}

function check-out() {
  echo "*Check Out*"
  jrnl -from today \
    | sed 's/#checkout//' \
    | cut -c 18- \
    | sed '/^$/d' \
    | sed 's/^/- /'
}
