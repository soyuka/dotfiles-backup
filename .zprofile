export EDITOR='vim'
export ANDROID_HOME="${HOME}/Android/Sdk"
# rust, andoid, composer global and local, then local node
export PATH="$PATH:$HOME/.cargo/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.config/composer/vendor/bin:vendor/bin:node_modules/.bin:$HOME/.local/bin"
# nvm, node
export NVM_DIR="${HOME}/.nvm"
export NVM_LAZY_LOAD=true

# startx on the 1st vt
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
WINIT_HIDPI_FACTOR="1.0"
