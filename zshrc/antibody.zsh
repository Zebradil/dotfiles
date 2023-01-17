# +=========================+
# | Antibody plugin manager |
# +-------------------------+

ANTIBODY_PLUGINS_FILE="${HOME}/.zsh_plugins.sh"

if lib::check_commands antibody && [[ ! -f "${ANTIBODY_PLUGINS_FILE}" ]]; then
    log::debug "Installing antibody plugins"
    ANTIBODY_PLUGINS=$(
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
    )
    antibody bundle <<<"${ANTIBODY_PLUGINS}" >"${ANTIBODY_PLUGINS_FILE}"
fi

if [ -f "${ANTIBODY_PLUGINS_FILE}" ]; then
    ZVM_INIT_MODE=sourcing

    source "${ANTIBODY_PLUGINS_FILE}"
fi
