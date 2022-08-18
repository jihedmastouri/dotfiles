setxkbmap -option caps:swapescape
tmux new-session -s "Home" 2> /dev/null

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
export EDITOR=nvim
export VISUAL=$EDITOR
export BROWSER=/usr/bin/firefox
export GOPATH=$HOME/go
export GIT_EDITOR=$EDITOR

# PATH
addToPath $GOROOT/bin
addToPath $GOPATH/bin
addToPath $HOME/.local/share/JetBrains/Toolbox/scripts
