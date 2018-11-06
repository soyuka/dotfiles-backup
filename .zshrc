# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
ZSH_CONFIG="${HOME}/.config/zsh"
ANTIGEN_DIR="$ZSH_CONFIG/antigen"
export NVM_DIR="${HOME}/.nvm"
export NVM_LAZY_LOAD=true
export ANDROID_HOME="${HOME}/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# composer global, local, node
export PATH="$PATH:$HOME/.config/composer/vendor/bin:vendor/bin:node_modules/.bin";

bindkey -e #emacs key bindings
source "$ZSH_CONFIG/aliases.zsh"
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
