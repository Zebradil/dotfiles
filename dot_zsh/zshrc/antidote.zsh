# +=========================+
# | Antidote plugin manager |
# +-------------------------+

antidote_plugins="$(
<<EOF
hcgraf/zsh-sudo
jeffreytse/zsh-vi-mode
robbyrussell/oh-my-zsh path:lib/git.zsh
robbyrussell/oh-my-zsh path:plugins/docker-machine
robbyrussell/oh-my-zsh path:plugins/git
unixorn/git-extra-commands
zchee/zsh-completions
zdharma-continuum/history-search-multi-word
zsh-users/zsh-autosuggestions
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOF
)"

antidote_source=/usr/share/zsh-antidote/antidote.zsh

if [[ ! -f $antidote_source ]]; then
    log::info "Antidote plugin manager not found. Please install it."
else
    source "$antidote_source"

    plugins_txt=${ZDOTDIR:-~}/.zsh_plugins.txt
    static_file=${ZDOTDIR:-~}/.zsh_plugins.zsh

    if [[ ! $static_file -nt $plugins_txt ]]; then
        log::debug "Installing antidote plugins..."
        antidote bundle <<<"$antidote_plugins" >"$static_file"
    fi

    source "$static_file"

    unset plugins_txt static_file
fi

unset antidote_plugins antidote_source
