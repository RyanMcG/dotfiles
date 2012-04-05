# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/.bash_top ]; then
	. ~/.bash_top
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export EDITOR="vim"
export VISUAL=$EDITOR
export PATH=$PATH:/usr/share/eclipse/:/opt/maven/bin/:/opt/android-sdk/platform-tools/:$HOME/bin/:$HOME/.cabal/bin/:$HOME/bin/node/bin/:$HOME/.gem/ruby/1.9.1/bin/
export CLASSPATH=.:src/:bin/
export PYTHONDOCS=/usr/share/doc/python2/html/
export JAVAOPTS=$JAVA_OPTS" -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n " #Make JVM's run with transport socket.
export CTAGS="--langmap=lisp:+.clj" # Make clj compile as LISP for ctags

#Custom Var to enable composite manager
export ENABLE_COMPMGR="no"

#Autossh fun
export MY_AUTOSSH_PORT=29011
export MY_AUTOSSH_PORT=$(expr $MY_AUTOSSH_PORT + $(pgrep -u $USER -x autossh | wc -l))
export NOSE_REDNOSE=1

unset HISTSIZE HISTFILESIZE
export HISTSIZE=20001
shopt -s histappend
shopt -s checkwinsize

#Set editing type to vi
set -o vi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

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

P_COLOR=$FBLK$BWHT

if [ -f ~/.bash_prompt_color ]; then
	. ~/.bash_prompt_color
fi

parse_git_branch() {
	if [[ $(pwd) != $HOME/mnt/* ]]; then
		if type __git_ps1 >/dev/null 2>&1; then
			__git_ps1 "%s"
		else
			git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
		fi
	fi
}
	
PS1="$P_COLOR$HC$RS$P_COLOR${debian_chroot:+($debian_chroot)}\u@\h:$RS$HC\w$RS $FGRN$HC\$(parse_git_branch)$RS
$P_COLOR$HC\$$RS "

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

if [ $TERM == "rxvt-unicode" ]; then
	export TERM="rxvt-unicode-256color"
fi

if [ $TERM == "xterm" ]; then
	export TERM="xterm-256color"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
    eval "`dircolors -b`"
    alias ls='ls -h --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -a -l'
alias la='ls -A'
#alias l='ls -CF'

# add an alert alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
