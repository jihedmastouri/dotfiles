# neofetch
neofetch --ascii_distro fedora_small

# Init
eval "$(starship init zsh)" # Theme
eval "$(fnm env --use-on-cd)"
eval "$(atuin init zsh)"

# PROPS
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# History of Directories
# setopt AUTO_PUSHD                  # pushes the old directory onto the stack
# setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
# setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')

setopt autocd autopushd pushdminus pushdsilent pushdtohome
DIRSTACKSIZE=5

# Completion Settings
autoload -U compinit && compinit
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'
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

# [[ `getTheme` == "dark" ]] && goingDark || letThereBeLight

# Plugins Init
PLUGINS="$HOME/.zsh/plugins"
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f "/home/mj/.ghcup/env" ] && source "/home/mj/.ghcup/env" # ghcup-env

export DARK_THEME=`cat ~/.terminal_theme`
