#!/bin/sh
if [[ $(uname) != "Darwin" ]]; then
	DEST_DIR=~/Library/Application\ Support/Google/Chrome/Default/User\ StyleSheets
else
	DEST_DIR=~/.config/google-chrome/Default/User\ StyleSheets
fi
lessc Custom.less $DEST_DIR/Custom.css
