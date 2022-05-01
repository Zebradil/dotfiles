#!/bin/bash

printf ' :Updating Nvim: ' | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'

nvim --headless +CocUpdate +PlugUpgrade +PlugUpdate +qall

echo
