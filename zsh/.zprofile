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
export GIT_EDITOR=$EDITOR
export WLR_DRM_NO_MODIFIERS=1
export TERM="xterm-256color"
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export PNPM_HOME="/home/mj/.local/share/pnpm"
export JAVA_HOME=/opt/android-studio/jbr
export PNPM_HOME="/home/mj/.local/share/pnpm"
export GOPATH=$HOME/go
export TERMINAL="ptyxis --new-window"
export BUN_INSTALL="$HOME/.bun"

# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.21.0.9-3.fc39.x86_64
# export JAVA_HOME=/usr/lib/java

# PATH
addToPath $HOME/.cargo/bin
addToPath $ANDROID_HOME/platform-tools
addToPath $ANDROID_HOME/emulator
addToPath $JAVA_HOME/bin
addToPath /usr/pgsql-12/lib
addToPath $HOME/.atuin/bin
addToPath /snap/bin
addToPath $HOME/.deno/bin
addToPath /usr/local/go/bin
addToPath $GOPATH/bin
addToPath $HOME/.local/share/fnm
addToPath $HOME/.ghcup/bin
addToPath $HOME/.opencode/bin

addToPathFront /usr/local/bin
addToPathFront $HOME/anaconda3/bin
addToPathFront $HOME/.turso
addToPathFront $PNPM_HOME
addToPathFront $BUN_INSTALL/bin

# Init theme
if [ ! -f ~/.terminal_theme ]; then
    touch ~/.terminal_theme
fi

# find $HOME/devenv/ -path "$PWD"
if [[ "$PWD" != *"$HOME/devenv"* ]]; then
 cd $HOME
fi
