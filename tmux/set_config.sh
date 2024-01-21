#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Removes the original configuration files and creates a symlink to the repository ones

BASEDIR="$(dirname "$(realpath "$0")")"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    (
        cd "$HOME/.tmux/plugins/tpm" || exit
        git pull
    )
fi

rm -f "$HOME/.tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$BASEDIR/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

