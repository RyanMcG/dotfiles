export GOPATH=$HOME/repo/gocode
export PYENV_ROOT="$HOME/.pyenv"
eval $(/opt/homebrew/bin/brew shellenv)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

path_prepend() {
    for arg in "$@"; do
        if [[ ":${PATH}:" != *":${arg}:"* ]]; then
            export PATH="${arg}${PATH:+":$PATH"}"
        fi
    done
}

# pyenv setup
path_prepend "$HOME/bin" "$HOME/.cargo/bin" "$GOPATH/bin" "$PYENV_ROOT/bin"
eval "$(pyenv init -)"

if [ -f ~/.profile_local ]; then
    source ~/.profile_local
fi
autoload -Uz compinit && compinit

unset HISTSIZE HISTFILESIZE
export HISTFILESIZE=9999999999
export HISTSIZE=9999999999
