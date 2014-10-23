#!/bin/sh

DIR=$(dirname $0)

cp -f "$DIR/.bashrc" "$HOME/.bashrc"

echo "Done. Now run:
	source ~/.bashrc"

exit 0