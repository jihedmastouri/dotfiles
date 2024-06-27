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
export PNPM_HOME="/home/mj/.local/share/pnpm"
export JAVA_HOME=/opt/android-studio/jbr
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.21.0.9-3.fc39.x86_64
# export JAVA_HOME=/usr/lib/java

# PATH
addToPath $GOPATH/bin
addToPath $HOME/.cargo/bin
addToPath $ANDROID_HOME/platform-tools
addToPath $ANDROID_HOME/emulator
addToPath $JAVA_HOME/bin
addToPath /usr/pgsql-12/lib
addToPath $HOME/.atuin/bin

addToPathFront $HOME/anaconda3/bin
addToPathFront $HOME/.turso
addToPathFront $PNPM_HOME

# Init Tmux
tmux has-session -t Home || tmux new-session -d -s Home

# Init theme
if [ ! -f ~/.terminal_theme ]; then
    touch ~/.terminal_theme
fi
