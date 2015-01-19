export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple2"

plugins=(osx git last-working-dir npm sublime web-search git-extras z)

source $ZSH/oh-my-zsh.sh


# User configuration
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:~/.composer/vendor/bin"
export MANPATH="/usr/local/man:$MANPATH"

if [[ -f $HOME/.specific ]]; then
  source $HOME/.specific
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# if [ -e /usr/share/terminfo/x/xterm-256color ]; then  
#  export TERM='xterm-256color'
# else  
  # export TERM='xterm'
# fi

alias tmux="TERM=screen-256color-bxe tmux"

unset GREP_OPTIONS #grep options are deprecated

calc() {
  echo "$(($@))"
}
