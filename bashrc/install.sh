#!/bin/sh

DIR=$(dirname $0)

cp -f "$DIR/.bashrc" "$HOME/.bashrc"
touch "$HOME/.bash_aliases"

echo "Done. Now run:
	source ~/.bashrc"

exit 0