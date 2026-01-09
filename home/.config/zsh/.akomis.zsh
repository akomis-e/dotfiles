

# alias la="ls -lah --color=auto --group-directories-first"
# alias la="rgrc ls -lA --group-directories-first"
alias la="eza -al --group-directories-first"
alias man="batman_p"
alias cat="bat -p"


alias cdc="cd ~/.config"

## MY GIT ALIASES
alias gits="git status"


alias p="print"
alias sshag="eval $(ssh-agent)"

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