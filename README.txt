conf/

This is (ideally) a version-controlled directory containing all of my
personal configs. The deploy.sh script is meant to idempotently deploy
all of the configs that need to be symlinked, and then compile and
locally (without needing root) deploy all of customized suckless builds.
This will also deploy my personal scripts, which are meant to be portable,
but that's a work-in-progress. Right now some of them are void-linux
specific (xbps).

The reason I use symlinks and don't just put this stuff directly in 
.config is because I noticed that a lot of programs that I install will
clutter up .config with automatically generated files. That sucks, because
.config is something I would like to version control, which means it should
be stuff I write and have control over. 

* tmux.conf    -> ~/.tmux.conf
* xinitrc      -> ~/.xinitrc
* vim-settings -> ~/.vim/
* lfrc         -> ~/.config/lfrc
* libvirt      -> ~/.config/libvirt
* tridactyl    -> ~/.config/tridactyl

conf/src
    * contians all of the source code for the suckless programs that require
      compiling to configure. They go here because they're part of my setup.
      Running deploy.sh will install them to ~/.local
        * st
        * dwm
        * nsxiv
