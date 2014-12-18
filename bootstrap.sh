#!/usr/bin/env bash

git pull origin master;

function createVundle() {
    # create Vundle directory:
    VUNDLE_DIR=~/.vim/bundle/Vundle.vim
    if [ ! -d "$VUNDLE_DIR" ]
    then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
}

function doIt() {
    rsync --exclude .git/ --exclude .DS_Store --exclude git/ \
          --exclude=*.sh --exclude=*.{md,txt} -avhr --no-perms . $1;
    source ~/.bashrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt ~;
elif [ "$1" == "--test" -o "$1" == "-t" ]; then
    echo "Test only: files are copied to the desktop";
    doIt ~/Desktop;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
            doIt ~;
    fi;
    createVundle;
fi;
unset doIt;
