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

# Completion Settings
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots)	
CASE_SENSITIVE="false"


# Imports
for FILE in $HOME/.zsh/*; do
	[[ -d $FILE ]] && continue
	source $FILE
done

# Plugins Init 
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)
