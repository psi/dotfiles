if [ $(hostname -s) = "ronin" ]; then
  export UNISON=$HOME/.unison
end

export UNISONLOCALHOSTNAME=$(hostname -s)

alias unison='unison -ui text'
alias sync-music='unison music'
