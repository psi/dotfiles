export REPORTTIME=30

if [[ -x `which terminal-notifier` ]]; then
    notify-preexec-hook() {
        zsh_notifier_cmd="$1"
        zsh_notifier_time="`date +%s`"
    }

    notify-precmd-hook() {
        local time_taken
        local excluded_commands=(vi vim)

        if [[ "${zsh_notifier_cmd}" != "" ]] && [[ -z "${excluded_commands[(r)${zsh_notifier_cmd}]}" ]]; then
            time_taken=$(( `date +%s` - ${zsh_notifier_time} ))
            if (( $time_taken > $REPORTTIME )); then
                terminal-notifier -subtitle "$zsh_notifier_cmd finished" \
                    -message "'$zsh_notifier_cmd' finished in $time_taken seconds"
            fi
        fi
        zsh_notifier_cmd=
    }
fi

[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions notify-preexec-hook)

[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions notify-precmd-hook)
