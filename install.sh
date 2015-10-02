#!/bin/sh

DIR=$(dirname $0)

cp -f "$DIR/bashrc/bashrc" "$HOME/.bashrc"
touch "$HOME/.bash_aliases"

cp -f "$DIR/vimrc/vimrc" "$HOME/.vimrc"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git


echo "Done. Now run:
	source ~/.bashrc"

exit 0

