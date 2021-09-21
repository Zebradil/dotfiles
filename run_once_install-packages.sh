#!/bin/bash

set -euo pipefail

sudo pacman -S --needed git base-devel

if ! command -v yay &> /dev/null
then
    readonly YAY_DIR=/tmp/yay
    rm -rf $YAY_DIR
    git clone https://aur.archlinux.org/yay.git $YAY_DIR
    cd $YAY_DIR
    makepkg -si
fi

yay -S --needed --answerclean N --answerdiff N \
    antibody-bin \
    bat \
    bpytop \
    duf \
    exa \
    fd \
    fzf \
    neovim \
    ripgrep \
    tmux \
    z \
    zsh \
    zsh-completions
