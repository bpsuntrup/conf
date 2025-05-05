# .bash_profile
#
# Copyright (C) Benjamin Paul Suntrup 2023. All rights reserved.
#
# NB: This is run for every login shell, but not for non-login shells.
# Conditions where your shell is a login shell:
#     * bash is started with -l or --login
#     * /bin/login gave you this shell
#     * ssh gave you this shell when you first logged in
#     * you `su - $USER`d to get this shell
#
#
# A login shell starts by running /etc/profile, then it searches for a user's
# .bash_profile, .bash_login, and .profile files running only the first one
# they see.
#
# i.e.
#
#     First run
#     /etc/profile
#
#     Then the run the first one found in this list
#     ~/.bash_profile
#     ~/.bash_login
#     ~/
#

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

sudo rdate pool.ntp.org

# If we're on tty1 (the default for this single-user machine) start the x
# server. This runs .xinitrc as well.
#
# Since we're restricting this to /dev/tty1, we won't have to worry about this
# running when we open up a pseudoterminal with ssh or su or something :)
#
# I could `exec` this, but that would mean that I wouldn't go back into my shell
# when I stop Xorg. I generally WANT to be in a shell when I kill Xorg.
if [[ "$(tty)" = "/dev/tty1" ]]; then
    #less $HOME/conf/banner.txt
	pgrep startx || startx
fi
