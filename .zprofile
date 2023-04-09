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
export DARK_THEME=`cat ~/.terminal_theme`
export WLR_DRM_NO_MODIFIERS=1
export GOPATH=$HOME/go

# PATH
addToPath $GOPATH/bin
addToPath /.dapr/bin
addToPath $HOME/.local/share/JetBrains/Toolbox/scripts
addToPath $HOME/.ghcup/bin
addToPath $HOME/.cabal/bin
addToPath $HOME/.cargo/bin

# Init Tmux
tmux has-session -t Home || tmux new-session -d -s Home
