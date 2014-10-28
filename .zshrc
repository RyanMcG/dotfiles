# Load in general_rc
if [ -f ~/.general_rc ]; then
	source ~/.general_rc
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ryanmcg"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#
plugins=(
git
archlinux
#nyan
lein
# heroku
#rbenv
#bundler
#ruby
#rails
# rails3
vi-mode
#vundle
#python
# pythonbrew
#pip
#virtualenvwrapper
#github
#gem
#cap
# battery
autojump
# rake
#node
#npm
# aws
# android
)


if [[ $NODENAME != "uecf4bb44a7f953ee8483" ]]; then
	plugins[200]=gpg-agent
fi

bindkey "^R" history-incremental-search-backward

source $ZSH/oh-my-zsh.sh

# Vim mode

bindkey -M vicmd v edit-command-line

# Turn off ZSH autocorrection
unsetopt correct_all

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
