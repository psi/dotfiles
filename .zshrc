# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=~/.zsh

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

plugins=(brew bundler cap gem git github osx rails ruby textmate vagrant)

source $ZSH/oh-my-zsh.sh
export PROMPT='%{$fg_bold[cyan]%}$(is_remote_host && echo `hostname -s`" ")%{$fg[green]%}${PWD/#$HOME/~} %{$fg_bold[cyan]%}$(is_homedir || echo `git_prompt_info`" ")%{$fg_bold[blue]%}%{$reset_color%}%# '
# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/Cellar/python/2.7.1/bin

export PYTHONPATH=/usr/local/lib/python2.6/site-packages

which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
alias knuck="knife cookbook upload $@"

export EC2_ACCESS_KEY=$AMAZON_ACCESS_KEY_ID
export EC2_SECRET_KEY=$AMAZON_SECRET_ACCESS_KEY
export AWS_ACCOUNT_ID=$AMAZON_USER_ID
export AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY
export AWS_CREDENTIAL_FILE=$HOME/.aws/credentials
export AWS_SSH_KEY_ID='jd'
export AWS_SSH_KEY_FILE='~/.ssh/id_jd'

export EC2_PRIVATE_KEY=~/.ec2/pk.pem
export EC2_CERT=~/.ec2/cert.pem

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.6/jars"

export UNISONLOCALHOSTNAME=$(hostname -s)

function is_homedir() {
  git config --get core.homedir > /dev/null
}

function is_remote_host() {
  echo $SSH_TTY | grep . > /dev/null
}

export NODE_PATH="/usr/local/lib/node"
