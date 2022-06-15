#!/bin/bash

set -euo pipefail

if ! command -v rustup &>/dev/null; then
    printf " /Skip update: rustup is not installed/ " | xargs -d/ -n1 printf '\033[1;30;43m %-40s \033[0m\n'
    exit 0
fi

printf ' :Updating Rust: ' | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'

rustup update
