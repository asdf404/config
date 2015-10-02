#!/bin/sh

DIR=$(dirname $0)

cp -f "$DIR/bashrc/bashrc" "$HOME/.bashrc"
touch "$HOME/.bash_aliases"

cp -f "$DIR/vimrc/vimrc" "$HOME/.vimrc"


echo "Done. Now run:
	source ~/.bashrc"

exit 0

