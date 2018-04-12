# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_CONFIG="${HOME}/.config/zsh"
ANTIGEN_DIR="$ZSH_CONFIG/antigen"
export NVM_DIR="${HOME}/.nvm"
export NVM_LAZY_LOAD=true
export ANDROID_HOME="${HOME}/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# global installed things
export PATH=$PATH:~/.local/bin:~/.config/composer/vendor/bin
# local
export PATH=$PATH:node_modules/.bin:vendor/bin

bindkey -e #emacs key bindings

source "$ZSH_CONFIG/antigen.zsh"

antigen use oh-my-zsh
antigen bundle git
antigen bundle git-extras
# antigen bundle gitfast
antigen bundle npm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle rupa/z
antigen bundle lukechilds/zsh-nvm
antigen theme $ZSH_CONFIG soyuka
antigen apply

zstyle :compinstall filename '/home/soyuka/.zshrc'
plugins=(zsh-completions)
autoload -U compinit
compinit

source "$ZSH_CONFIG/aliases.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
