export ZSH="$HOME/.config/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# cd ~/.config/oh-my-zsh
# ZSH_THEME="afowler"

ZSH_THEME="crunch-edit" # not bad
# ZSH_THEME="dieter" # not bad

# to make LS show all dot files at the top
export LC_COLLATE="C"

export PATH="${HOME}/.local/bin/:${HOME}/bin/:${HOME}/.cargo/bin:${PATH}"

plugins=(
	git
	aliases
	battery
	# zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh
source $XDG_CONFIG_HOME/zsh/.akomis.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"