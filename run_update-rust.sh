#!/bin/bash

printf ' :Updating Rust: ' | xargs -d: -n1 printf '\033[1;30;42m %-40s \033[0m\n'

rustup update
