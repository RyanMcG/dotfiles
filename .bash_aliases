#CHANGE DIRECTORIES
alias cweb="cd ~/cur/web/"
alias cwrk="cd ~/cur/work/"
alias cwww="cd ~/www/"
alias ccur="cd ~/cur/rent/"
alias ccse="cd ~/cur/rent/CSE\ 560"
alias cpro="cd ~/cur/rent/CSE\ 560/project"
alias chltheme="cd ~/cur/web/halfline/wordpress/wp-content/themes/halfline"    

#SSH/SFTP/rDESKTOP

#SSHFS/RSYNC
alias sshfs="sshfs -o allow_other -o sshfs_sync -o follow_symlinks -C"
alias sshfs321="sshfs -o sshfs_sync -o follow_symlinks -C mcgowanr@stdsun.cse.ohio-state.edu:/project/c321ac14 ~/mnt/c321ac14"
alias sshfscse="sshfs -o sshfs_sync -o follow_symlinks -C mcgowanr@stdsun.cse.ohio-state.edu: ~/mnt/cse"
alias sshfsh="sshfs -o allow_other -o sshfs_sync -o follow_symlinks -C -p 722 th-ro.in: ~/mnt/throin"
alias sshfsvonnie="sshfs -o allow_other -o sshfs_sync -o follow_symlinks -C ryanm_vonnie@ssh.phx.nearlyfreespeech.net: ~/mnt/vonnie"
alias sshfsryanmcg="sshfs -o allow_other -o sshfs_sync -o follow_symlinks -C ryanm_ryanmcg@ssh.phx.nearlyfreespeech.net: ~/mnt/ryanmcg"
alias sshfshalfline="sshfs -o allow_other -o sshfs_sync -o follow_symlinks -C -p 2468 halfline@74.118.64.10: ~/mnt/halfline"
alias rsy-vonnie-pull="rsync -auzP -e 'ssh' ryanm_vonnie@ssh.phx.nearlyfreespeech.net:wordpress/wp-content/themes/vonnie/ ~/cur/web/vonnie/themes/vonnie"
alias rsync-hafline-put="rsync -auzP -e 'ssh' /home/roin/cur/web/halfline/wordpress/wp-content/ halfline:www/wordpress/wp-content --exclude 'tags' --exclude '.git*' --exclude '*.sass*' --exclude '*.swp' --exclude '*.scss' --exclude 'pg-db-info.inc'"
alias rsync-wow-put="rsync -auzP --delete -e 'ssh' /home/roin/cur/work/Drupaly/themes/wow/ wow:/var/www/vhosts/wow/themes/wow --exclude 'tags' --exclude '.git*' --exclude '*.sass*' --exclude '*.swp' --exclude '*.scss' --exclude 'uploaded' --exclude 'NOTES.txt' --exclude 'demo' --exclude 'mmcschol_drp11.sql'" 

#PACAKGE MANAGERS
alias addpkg="yaourt -S"
alias rmpkg="yaourt -Rs"
alias update="yaourt -Sy"
alias uppkg="yaourt -Su"
alias uuppkg="yaourt -Syu"
alias search="yaourt -Ss"
alias query="yaourt -Qs"
alias autormpkg="yaourt -Qdt"

alias spc="sudo pacman"
alias yar="yaourt"

#OTHER STUFF
alias cl="clear"
alias cls="clear && ls"
alias transloc="transmission-remote --auth=roinator:shaddow7044"
alias lg="ls -A -l | grep"
alias svim="sudo vim"
alias :q="exit"
alias umplayer="urxvt -e mplayer"
alias drop="dropbox"
alias shutd="sudo shutdown -h now"
alias vimba="vim ~/.bash_aliases"
alias by="byobu"
alias ncm="ncmpcpp"
alias mpc="mpc -f \"[[[%artist% - ]%album% - ]%title%]\""
alias relbash="source ~/.profile"
alias vimget="vim ~/Documents/get.list"
alias sudo="sudo "
alias g="git"
alias gcam="git commit -am"
alias lp="lp -o cpi=17 -o lpi=8"
alias scn="screen -DR"
alias relterm="export TERM=$TERM"
alias dodj="djmount ~/mnt/upnp"
alias ftp="tnftp"

# Custom Functions
wiki() {
    dig +short txt $1.wp.dg.cx
}

