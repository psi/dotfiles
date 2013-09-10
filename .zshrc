# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=~/.zsh

SOCK="$HOME/.ssh/ssh_auth_sock"

#if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
#  rm -f $SOCK
#  ln -sf $SSH_AUTH_SOCK $SOCK
#  export SSH_AUTH_SOCK=$SOCK
#fi

# Auto-launch tmux if it's installed and we're remote
if which tmux >/dev/null 2>&1; then
  if [ "$SSH_TTY" != "" ] && [ "$TMUX" = "" ]; then
    tmux attach || tmux new; exit
  fi
fi

if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

export EDITOR=vim

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="garyblessington"
export ZSH_THEME="cloud"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

plugins=(brew bundler cap gem git github osx rails ruby textmate vagrant knife)

fpath=(~/.zsh/completion $fpath)

source $ZSH/oh-my-zsh.sh

set -o vi

export PROMPT='%{$fg_bold[cyan]%}$(is_remote_host && echo `hostname -s`" ")%{$fg[green]%}${PWD/#$HOME/~} %{$fg_bold[cyan]%}$(is_homedir || echo `git_prompt_info`" ")%{$fg_bold[blue]%}%{$reset_color%}%# '
# Customize to your needs...
export PATH=$HOME/bin:$HOME/.cabal/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/Cellar/python/2.7.1/bin

export PYTHONPATH=/usr/local/lib/python2.6/site-packages

which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

function is_homedir() {
  git config --get core.homedir > /dev/null
}

function is_remote_host() {
  echo $SSH_TTY | grep . > /dev/null
}

export NODE_PATH="/usr/local/lib/node"

eval "$(${HOME}/.chefvm/bin/chefvm init -)"

if [ -f /opt/boxen/env.sh ]; then
  source /opt/boxen/env.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
