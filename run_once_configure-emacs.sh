#!/bin/bash

set -euo pipefail

readonly DOOM_DIR=~/.emacs_doom
readonly SPACEMACS_DIR=~/.emacs_spacemacs

if [[ ! -d "${DOOM_DIR}" ]]
then
    git clone https://github.com/hlissner/doom-emacs "${DOOM_DIR}"
    "${DOOM_DIR}/bin/doom" install
fi

if [[ ! -d "${SPACEMACS_DIR}" ]]
then
    git clone https://github.com/syl20bnr/spacemacs "${SPACEMACS_DIR}"
fi

[ -f ~/.emacs ] && mv ~/.emacs ~/.emacs.bak
[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.legacy
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

