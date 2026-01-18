

# alias la="ls -lah --color=auto --group-directories-first"
# alias la="rgrc ls -lA --group-directories-first"
alias la="eza -al --group-directories-first"
alias bla="bat -p" # to allow appending b to 'la' command to view a file

alias bman="batman_p"
alias cat="bat -p"


alias cdc="cd ~/.config"

## MY GIT ALIASES
alias gits="git status"


alias p="print"
alias o="handlr open"
alias vi="nvim"



alias inst="sudo pacman -Syu"

alias yayy="yay -Syu --noremovemake --answerclean None --answerdiff None"

function sshag(){
	eval $(ssh-agent)
	ssh-add ~/.ssh/id_rsa
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

## Batman
export BAT_THEME=gruvbox-dark

batman_p() {
    #do things with parameters like $1 such as
    if (( $# == 2 ))
	then
		/usr/bin/man $1 $2 | bat -pl manpage
    elif (( $# == 1 ))
	then
		/usr/bin/man $1 | bat -pl manpage
	else
		echo 'batman: expected 1 or 2 parameters to man'
	fi
}


# ls -AFoqv --color --group-directories-first
