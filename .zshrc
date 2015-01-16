export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple2"

plugins=(osx git last-working-dir npm sublime web-search git-extras z)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

if [[ -f $HOME/specific.sh ]]; then
  source $HOME/specific.sh
fi

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

unset GREP_OPTIONS #grep options are deprecated
