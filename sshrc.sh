# for stabilizing the ssh agent socket when connection changes for tmux
# see https://werat.dev/blog/happy-ssh-agent-forwarding/
if [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
