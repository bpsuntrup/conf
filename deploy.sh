#!/bin/sh
#
# deploy.sh
#
# Copyright 2023 Benjamin Paul Suntrup
#
# deploys configs. Must be run from conf/

deploy_link () {
    echo "Deploying $1..."
    target=${2:-$1}
    if [ -e $HOME/$target ] && [ ! -L $HOME/$target ]; then
        echo "Cannot deploy $1: file $HOME/$target exists!"
    else
        [ -L $HOME/$target ] && rm $HOME/$target
        ln -s $HOME/conf/$1 $HOME/$target
    fi
}

deploy_link vim-settings .vim

if [ -f $HOME/.vimrc ]; then
    echo "WARNING: wild $HOME/.vimrc detected. This will conflict with conf/vim-settings/vimrc"
fi

deploy_link tmux.conf .tmux.conf
deploy_link xinitrc .xinitrc

mkdir -p $HOME/.config
chmod +x $HOME/conf/bin/*

# TODO: make these ones XDG compliant
deploy_link lf .config/lf
deploy_link libvirt .config/libvirt
deploy_link tridactyl .config/tridactyl
deploy_link bashrc .bashrc
deploy_link bash_profile .bash_profile
deploy_link xinitrc .xinitrc
deploy_link xserverrc .xserverrc
deploy_link Xresources .Xresources
deploy_link xbindkeysrc .xbindkeysrc
deploy_link todo.conf .config/todo.conf
deploy_link emacs .config/emacs
deploy_link nvim .config/nvim
deploy_link helix .config/helix
deploy_link sshrc.sh .ssh/rc

echo "Deploying st..."
(cd $HOME/conf/src/st && make clean install > /dev/null)
echo "Deploying dwm..."
(cd $HOME/conf/src/dwm && make clean install > /dev/null)
echo "Deploying nsxiv..."
(cd $HOME/conf/src/nsxiv && make clean install > /dev/null)

mkdir -p $XDG_STATE_HOME/vim/

echo "Done."
