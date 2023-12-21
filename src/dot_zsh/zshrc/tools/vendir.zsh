# +==========================+
# | Vendir configuration     |
# +--------------------------+

if lib::check_commands vendir; then
    log::debug "Configuring vendir"
    export VENDIR_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/vendir"
fi
