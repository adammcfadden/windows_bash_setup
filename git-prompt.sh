if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

# Colors
# OPTIONAL - if you want to use any of these other colors:
  local        BLACK="\[\033[0;30m\]"

  local    DARK_GREY="\[\033[1;30m\]"

  local          RED="\[\033[0;31m\]"

  local    LIGHT_RED="\[\033[1;31m\]"

  local        GREEN="\[\033[0;32m\]"

  local  LIGHT_GREEN="\[\033[1;32m\]"

  local       YELLOW="\[\033[0;33m\]"

  local LIGHT_YELLOW="\[\033[1;33m\]"

  local         BLUE="\[\033[0;34m\]"

  local   LIGHT_BLUE="\[\033[1;34m\]"

  local       VIOLET="\[\033[0;35m\]"

  local LIGHT_VIOLET="\[\033[1;35m\]"

  local         TEAL="\[\033[0;36m\]"

  local   LIGHT_TEAL="\[\033[1;36m\]"

  local   LIGHT_GREY="\[\033[0;37m\]"

  local        WHITE="\[\033[1;37m\]"

	local       ORANGE="\[\033[01;38;5;202m\]"
# END OPTIONAL
  local     DEFAULT="\[\033[0m\]"

PS1="$LIGHT_GREY""$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]" 	# set window title
PS1="$PS1"'\n'                 																# new line
PS1="$PS1""$ORANGE"       																		# change to orange
PS1="$PS1"'\u@\h '             																# user@host<space>
# PS1="$PS1"'\[\033[35m\]'       															# DISABLED - change to purple
# PS1="$PS1"'$MSYSTEM '          															# DISABLED - show MSYSTEM
PS1="$PS1""$LIGHT_BLUE"       																# change to lightblue
PS1="$PS1"'\w'                 																# current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1""$WHITE"  																			# change color to white
		PS1="$PS1"'`__git_ps1`'   																# bash function
	fi
fi
PS1="$PS1""$ORANGE"        																		# change color
PS1="$PS1"'\n'                 																# new line
PS1="$PS1""(>'')> "            																# prompt: always (>'')>
PS1="$PS1""$WHITE"		 																				# test should be white
MSYS2_PS1="$PS1"               																# for detection by MSYS2 SDK's bash.basrc
