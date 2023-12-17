# +==========================+
# | GitHub CLI related       |
# +--------------------------+

if lib::check_commands gh; then
    my:git:cd-to-repo() {
        local repo="${1:?repo name is required}"
        # Check if $repo contains a slash, if not, add the default org
        if [[ ! "$repo" =~ / ]]; then
            repo="zebradil/$repo"
        fi
        local dir="$HOME/code/github.com/$repo"
        if [[ ! -d "$dir" ]]; then
            gh repo clone "$repo" "$dir"
        fi
        cd "$dir"
    }
fi
