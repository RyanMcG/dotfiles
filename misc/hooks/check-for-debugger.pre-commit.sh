#!/bin/sh

COMMAND='git grep -n --cached -e debugger -e "binding\.pry" -- app config db spec vendor script lib Rakefile Guardfile Capfile'
if [ `$COMMAND` ]
then
	echo "You have a binding.pry or a debugger in a bad place.\n"
	$COMMAND
	exit 1
fi
