# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jonathan"

# PROPS
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
        git
		pip
		npm
		golang
		docker
		zsh-autosuggestions
		zsh-syntax-highlighting
       )

source $ZSH/oh-my-zsh.sh

# Spliting the config
for FILE in ~/.zsh/*; do
    source $FILE
done

# EVALS
eval $(thefuck --alias)
