# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_CONFIG="${HOME}/.config/zsh"
ANTIGEN_DIR="$ZSH_CONFIG/antigen"
export NVM_DIR="${HOME}/.nvm"
export ANDROID_HOME="${HOME}/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:node_modules/.bin

bindkey -e #emacs key bindings

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source "$ZSH_CONFIG/antigen.zsh"

antigen use oh-my-zsh
antigen bundle git
antigen bundle git-extras
# antigen bundle gitfast

antigen bundle npm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle rupa/z
antigen theme $ZSH_CONFIG soyuka
antigen apply

zstyle :compinstall filename '/home/soyuka/.zshrc'
plugins=(zsh-completions)
autoload -U compinit
compinit

source "$ZSH_CONFIG/aliases.zsh"
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
PATH=$PATH:$HOME/.config/composer/vendor/bin
# shit truc pour complier ffmpeg.js
PATH=$PATH:/usr/lib/emsdk:/usr/lib/emsdk/clang/e1.37.14_64bit:/usr/lib/emsdk/node/4.1.1_64bit/bin:/usr/lib/emsdk/emscripten/1.37.14

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
