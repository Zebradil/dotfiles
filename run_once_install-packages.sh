#!/bin/bash

set -euo pipefail

header(){
    printf " :%s: " "$1" | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'
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
    neovim \
    nodejs \
    ripgrep \
    rsync \
    tmux \
    yarn \
    z \
    zsh \
    zsh-completions

# TODO: add desktop packages
#       firefox
#       i3-gaps
#       i3blocks
#       i3status
#       lightdm
#       lightdm-settings
#       lightdm-slick-greeter
#       noto-fonts
#       noto-fonts-emoji
#       rofi
#       rofi-emoji
#       ttf-dejavu
#       ttf-iosevka
#       ttf-ms-fonts
#       pavucontrol
#       pulseaudio
#       pulseaudio-alsa
#       nerd-fonts-jetbrains-mono
#       feh
#       lxappearance-gtk3
#       xorg
#       mint-themes
#       mint-y-icons
#       alacritty
#       bitwarden
#       keepassxc
#       gnome-keyring
#       ttf-roboto
#       ttf-roboto-mono
#       variety
#       xclip
#       xfce4-notifyd
#       xkb-switch-i3
#       xsel
