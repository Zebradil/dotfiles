#!/bin/bash
# vim: set ft=bash :

UPDATE_FREQUENCY='7 days'

set -euo pipefail

if ! command -v rustup &>/dev/null; then
    printf " /Skip update: rustup is not installed/ " | xargs -d/ -n1 printf '\033[1;30;43m %-77s \033[0m\n'
    exit 0
fi

state_file="{{.chezmoi.cacheDir}}/rustup-updated"
now_file="$(mktemp)"
touch -d "$UPDATE_FREQUENCY ago" "$now_file"

if [[ ! -f "${state_file}" || "${state_file}" -ot "${now_file}" ]]
then
    printf ' :Updating Rust: ' | xargs -d: -n1 printf '\033[1;30;42m %-77s \033[0m\n'
    rustup update
    touch "${state_file}"
fi
