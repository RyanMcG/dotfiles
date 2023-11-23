export GOPATH=$HOME/repo/gocode
eval $(/opt/homebrew/bin/brew shellenv)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export PATH=$HOME/bin:$HOME/.cargo/bin:$GOPATH/bin:$PATH

if [ -f ~/.profile_local ]; then
    source ~/.profile_local
fi
