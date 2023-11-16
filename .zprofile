# FUNCTIONS
addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# VARIABLES
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export EDITOR="nvim"
export VISUAL=$EDITOR
export BROWSER=/usr/bin/firefox
export GOPATH=$HOME/go
export GIT_EDITOR=$EDITOR
export WLR_DRM_NO_MODIFIERS=1
export GOPATH=$HOME/go
export TERM='tmux-256color'
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

# PATH
addToPath $GOPATH
addToPath $HOME/.cargo/bin

addToPathFront $HOME/anaconda3/bin
addToPathFront $HOME/.turso

# Init Tmux
tmux has-session -t Home || tmux new-session -d -s Home
