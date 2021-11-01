#!/bin/bash

set -euo pipefail

printf ' :Updating Antibody: ' | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
