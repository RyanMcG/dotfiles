#CHANGE DIRECTORIES
alias cweb="cd ~/cur/web/"
alias cwrk="cd ~/cur/work/"
alias cwww="cd ~/www/"
alias ccur="cd ~/cur/rent/"
alias cpro="cd ~/cur/rent/CSE\ 560/project"

#SSHFS/RSYNC
alias sshfs="sshfs -o reconnect -o allow_other -o follow_symlinks"
alias asshfs="sshfs -o ssh_command='autossh -M $MY_AUTOSSH_PORT' -o allow_other -o follow_symlinks"
alias assh="autossh -M $MY_AUTOSSH_PORT"
alias rsync-vonnie-pull="rsync -azP -e 'ssh' ryanm_vonnie@ssh.phx.nearlyfreespeech.net:wordpress/wp-content/themes/vonnie/ ~/cur/web/vonnie/themes/vonnie"
alias rsync-wow-put="rsync -azP --delete -e 'ssh' /home/roin/cur/work/StudioCT/Drupaly/themes/wow/ wow:/var/www/vhosts/wow/themes/wow --exclude 'tags' --exclude '.git*' --exclude '*.sass*' --exclude '*.swp' --exclude '*.scss' --exclude 'uploaded' --exclude 'NOTES.txt' --exclude 'demo' --exclude 'mmcschol_drp11.sql' --exclude 'wowpics*'" 

#PACAKGE MANAGERS
if [ -f ~/.bash_aliases_pkg ]; then
	. ~/.bash_aliases_pkg
fi

#OTHER STUFF
alias cl="clear"
alias cls="clear && ls"
alias lg="ll | grep"
alias svim="sudo vim"
alias :q="exit"
alias umplayer="urxvt -e mplayer"
alias shutd="sudo shutdown -h now"
alias vimba="vim ~/.bash_aliases"
alias ncm="ncmpcpp"
alias mpc="mpc -f \"[[[%artist% - ]%album% - ]%title%]\""
alias relbash="source ~/.profile"
alias vim-music="vim ~/Documents/Lists/get.list"
alias vim-todo="vim ~/Documents/Lists/todo.list"
alias sudo="sudo "
alias g="git"
#Make autocompleteion work for g alias too
complete -o default -o nospace -F _git g
alias h="hg"
alias lp="lp -o cpi=17 -o lpi=8"
alias scn="screen -DR"
alias dodj="djmount ~/mnt/upnp"
alias ftp="tnftp"
alias relterm="export TERM=$TERM"
alias dodj="djmount ~/mnt/upnp"
alias ftp="tnftp"
alias rm="rm -i"
alias rmf="rm -f"
alias cdiff="colordiff"
alias fif="find -type f -print0 | xargs -0 grep -n" 
alias intersection="grep -Fx -f"
alias in2not1="grep -Fxv -f"

# Custom Functions
wiki() {
    dig +short txt $1.wp.dg.cx
}
