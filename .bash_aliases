#PACAKGE MANAGERS
if [ -f ~/.bash_aliases_pkg ]; then
	. ~/.bash_aliases_pkg
fi

#Make autocompleteion work for g and h aliases
if type _hg > /dev/null 2>&1; then
	complete -o default -o nospace -F _hg h
fi

if type _git > /dev/null 2>&1; then
	complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
		|| complete -o default -o nospace -F _git g
fi

# Custom Functions
wiki() {
    dig +short txt $1.wp.dg.cx
}
