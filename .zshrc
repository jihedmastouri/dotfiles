# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jonathan"

# TO GOOGLE:
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# Example format: plugins=(rails git textmate ruby lighthouse)
# export ARCHFLAGS="-arch x86_64"

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

eval "$(zoxide init zsh)"
