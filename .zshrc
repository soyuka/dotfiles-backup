export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple2"
# norm avit af-magic ys

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(osx git last-working-dir npm sublime web-search)

source $ZSH/oh-my-zsh.sh

# Loads nvm

# User configuration

export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:~/.composer/vendor/bin"
export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export DEBUG="ezseed:*"

if [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias tmux='tmux -2'

  export OCI_HOME=$ORACLE_HOME
  export OCI_INCLUDE_DIR=/usr/include/oracle/11.2/client64
  export OCI_LIB_DIR=$ORACLE_HOME/lib
  # export ORACLE_HOME=/usr/lib/oracle/11.2/client64
  # export C_INCLUDE_PATH=/usr/include/oracle/11.2/client64
  # export LD_LIBRARY_PATH=$ORACLE_HOME/lib
  # export TERM="xterm-256color"
  # export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1 
  # export NLS_LANG=FRENCH_FRANCE.UTF8
  . /etc/profile.d/oracle.sh

  sites() {
          cd "/var/www/$1"
  }

else
  sites() {
          cd "/Users/soyuka/Sites/$1"
  }

  ez() {
   sites ezseed/ezseed
  }
fi


export NVM_DIR="/home/abluchet/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export ES_HOME=/usr/share/elasticsearch

#142sk3
kimsufi() {
http -u -b GET https://ws.ovh.com/dedicated/r2/ws.dispatcher/getAvailability2\?callback\= | jq --arg ks $1 '.answer.availability[] | select(. | contains({reference: $ks})) | .zones[] | select(.availability != "unavailable")'

}

if [ -e /usr/share/terminfo/x/xterm-256color ]; then  
 export TERM='xterm-256color'
else  
  export TERM='xterm-color'
fi
