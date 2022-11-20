[[ "$TERM" == "xterm-kitty" ]] && `tmux attach -t Home 2> /dev/null || tmux new -s Home`

# neofetch
neofetch --ascii_distro fedora_small

# Init
eval "$(starship init zsh)" # Theme

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

[[ `getTheme` == "dark" ]] && goingDark || letThereBeLight

# Plugins Init
PLUGINS="$HOME/.zsh/plugins"
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
