# +==========================+
# | Tailscale                |
# +--------------------------+

if lib::check_commands tailscale; then
  my:tailscale:switch() {
    local tailnet="$1"
    if [[ -z $tailnet ]]; then
      tailnet=$(sudo tailscale switch --list | head -n +2 | fzf | awk '{print $1}')
    fi
    sudo tailscale switch "$tailnet"
  }

  alias tssw=my:tailscale:switch
fi
