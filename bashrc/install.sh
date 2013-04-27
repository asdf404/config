#!/bin/sh

DIR=$(dirname $0)

cp -f "$DIR/.bashrc" "$HOME/.bashrc"
cp -f "$DIR/.bash_aliases" "$HOME/.bash_aliases"

echo "Done. Now run:
	source ~/.bashrc"

exit 0