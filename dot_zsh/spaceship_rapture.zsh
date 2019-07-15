SPACESHIP_RAPTURE_SHOW="${SPACESHIP_RAPTURE_SHOW=true}"
SPACESHIP_RAPTURE_SYMBOL="${SPACESHIP_RAPTURE_SYMBOL="☁️" }"
SPACESHIP_RAPTURE_PREFIX="${SPACESHIP_RAPTURE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RAPTURE_SUFFIX="${SPACESHIP_RAPTURE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RAPTURE_COLOR="${SPACESHIP_RAPTURE_COLOR="blue"}"

ACCOUNT_MAP=${HOME}/src/ins/rundmc/consul/public/aws/accounts.json

spaceship_rapture() {
  (( ${+VAULTED_ENV} )) || return

  if (( ${+VAULTED_ENV_EXPIRATION} ));
  then
    exp=$(gdate --date="${VAULTED_ENV_EXPIRATION}" "+%s")

    if [[ $exp < $(date "+%s") ]]; then
      # Credentials are expired. Show nothing.
      return
    #else if [[ ($exp - $(date "+%s")) -lt 30 ]]; then
    #  credentials_expiring_soon=1
    fi
  fi

  iam_arn=$(rapture whoami)
  account_id=$(echo ${iam_arn} | cut -d':' -f5)
  account_name=$(jq -r ".account_aliases[\"${account_id}\"]" ${ACCOUNT_MAP})

  if (( ${+RAPTURE_ASSUMED_ROLE_ARN} )); then
    username=$(echo ${RAPTURE_ASSUMED_ROLE_ARN} | cut -d':' -f6 | awk -F'/' '{print $NF}')
  else
    username=$(echo ${iam_arn} | cut -d':' -f6 | awk -F'/' '{print $NF}')
  fi

  spaceship::section \
    "$SPACESHIP_RAPTURE_COLOR" \
    "$SPACESHIP_RAPTURE_PREFIX" \
    "$SPACESHIP_RAPTURE_SYMBOL${account_name}/${username} " \
    "$SPACESHIP_RAPTURE_SUFFIX"
}
