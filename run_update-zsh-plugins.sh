#!/bin/zsh

set -euo pipefail

if ! command antidote &> /dev/null
then
    printf ' :Updating ZSH plugins: ' \
        | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'
    antidote update
else
    printf ' :Skip update: antidote is not installed: ' \
        | xargs -d: -n1 printf '\033[1;30;43m %-40s \033[0m\n'
fi
