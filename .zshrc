# User configuration
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

# Zsh config directory
export ZSH_CONFIG="${HOME}/.config/zsh"
# Change antigen directory
export ADOTDIR="$ZSH_CONFIG/antigen"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export DEBUG="*"

# Loads nvm
[ -s "${HOME}/.nvm/nvm.sh" ] && . "${HOME}/.nvm/nvm.sh"

# Todo - crap
composer() {
  /usr/bin/composer.phar $@
}

calc() {
  echo "$(($@))"
}

# Just 4 fun, availability of a kimsufi 
#eg: kimsufi 142sk3
kimsufi() {
  http GET https://ws.ovh.com/dedicated/r2/ws.dispatcher/getAvailability2\?callback\= | jq --arg ks $1 '.answer.availability[] | select(. | contains({reference: $ks})) | .zones[] | select(.availability != "unavailable")'
}

# Load specs by system
[ -f "$ZSH_CONFIG/specific.sh" ] && source "$ZSH_CONFIG/specific.sh"

source "$ZSH_CONFIG/antigen.zsh"

antigen use oh-my-zsh
antigen bundle git
antigen bundle git-extras
antigen bundle gitfast

antigen bundle npm
antigen bundle command-not-found

# Syntax
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src

# z <3
antigen bundle rupa/z
# git extras
antigen theme $ZSH_CONFIG soyuka

antigen apply
