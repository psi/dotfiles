function 1pw-get-username() {
  1pw-get-field "$1" "username"
}

function 1pw-get-password() {
  1pw-get-field "$1" "password"
}

function 1pw-get-field() {
  op get item "$1" | jq -r ".details.fields[] | select(.name==\"$2\").value"
}
