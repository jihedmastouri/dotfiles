# neofetch
neofetch --ascii_distro fedora_small

# Theme Init 
fpath+=($HOME/.zsh/pure)
PLUGINS="$HOME/.zsh/plugins"                                                    

# Prompt Theme: Pure
autoload -U promptinit; promptinit
prompt pure

# PROPS
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Default Comp
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# Imports
for FILE in $HOME/.zsh/*; do
	[[ ! -d $FILE ]] && source $FILE
done

# Plugins Init 
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
