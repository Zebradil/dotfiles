#!/bin/bash

set -euo pipefail

header(){
    printf " :$1: " | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'
}

header "Installing base packages"

sudo pacman -S --needed git base-devel

if ! command -v yay &> /dev/null
then
    header "Installing yay"

    readonly YAY_DIR=/tmp/yay
    rm -rf $YAY_DIR
    git clone https://aur.archlinux.org/yay.git $YAY_DIR
    cd $YAY_DIR
    makepkg -si
fi

header "Installing optional packages"

yay -S --needed --answerclean N --answerdiff N \
    antibody-bin \
    aspell \
    aspell-de \
    aspell-en \
    aspell-ru \
    bat \
    bpytop \
    duf \
    emacs \
    exa \
    fd \
    fzf \
    hunspell \
    hunspell-de \
    hunspell-en_us \
    hunspell-ru \
    neovim-git \
    nodejs \
    ripgrep \
    rsync \
    tmux \
    z \
    zsh \
    zsh-completions
