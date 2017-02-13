# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias c='clear'
alias ga='git add -A .'
alias gc='git checkout'
alias gg='git log --graph --oneline --all --decorate --remotes'
alias gst='git status'
alias gp='git pull'
alias gb="git checkout -b"
alias gf='git fetch'
alias gitrmlocal='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "dev" | xargs -n 1 git branch -d'



case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
