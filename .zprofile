source ~/BashScripts/tmux-power

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
export EDITOR="nvim --server /tmp/neomj --remote"
export VISUAL=$EDITOR
export BROWSER=/usr/bin/firefox
export GOPATH=$HOME/go
export GIT_EDITOR=$EDITOR
export DARK_CAT="Catppuccin Kitty Mocha"
export DAY_CAT="Catppuccin Kitty Latte"
export WLR_DRM_NO_MODIFIERS=1

# set hadoop home <ch:2021>
export HADOOP_HOME=$HOME/apps/hadoop
export HADOOP_CONF_DIR=$HOME/apps/hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=$HOME/apps/hadoop
export HADOOP_COMMON_HOME=$HOME/apps/hadoop
export HADOOP_HDFS_HOME=$HOME/apps/hadoop
export YARN_HOME=$HOME/apps/hadoop

# PATH
addToPath $GOROOT/bin
addToPath $GOPATH/bin
addToPath $HOME/.local/share/JetBrains/Toolbox/scripts
addToPath $HOME/apps/hadoop/bin
