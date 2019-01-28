# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/.general_rc ]; then
    source ~/.general_rc
fi

if [ -f ~/.bash_top ]; then
	. ~/.bash_top
fi

shopt -s histappend
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
source '/Users/rmcgowan/work/blessclient/lyftprofile' # bless ssh alias
