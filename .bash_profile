# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_colored_prompt=yes
color_prompt=yes

#ANSI color code
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

P_COLOR=$HC$FBLE


parse_git_branch() {
	if [[ $(pwd) != $HOME/mnt/* ]]; then
		if type __git_ps1 >/dev/null 2>&1; then
			__git_ps1 "%s"
		else
			git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
		fi
	fi
}

PS1="$HC\w$RS $FGRN\$(parse_git_branch)$RS$P_COLOR\$$RS "

unset color_prompt force_color_prompt

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
