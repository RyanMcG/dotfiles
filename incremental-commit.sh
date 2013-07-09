#!/bin/sh
set -e

# Update vim plugins
vim +BundleInstall! +qa

# Change directories to the current one containg this script.
cd `dirname $0`

# Attempt an incremental commit
git reset HEAD
git add .vim/bundle/
git commit -m "Incremental commit."
