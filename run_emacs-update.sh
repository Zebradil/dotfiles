#!/bin/bash

set -euo pipefail

readonly EMACS_HOME="${HOME}/.emacs.d"

git -C "$EMACS_HOME" pull

emacs --batch -l "${EMACS_HOME}/init.el" --eval="(configuration-layer/update-packages t)"

systemctl restart --no-block --user emacs
