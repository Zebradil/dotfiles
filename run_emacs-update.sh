#!/bin/bash

set -euo pipefail

git -C ~/.emacs pull

emacs --batch -l ~/.emacs.d/init.el --eval="(configuration-layer/update-packages t)"
