# +=========================+
# | Gnome keyring           |
# +-------------------------+

if lib::check_commands gnome-keyring-daemon; then
  log::debug "Configuring gnome-keyring environment"

  if ! pgrep -f gnome-keyring-daemon >/dev/null; then
    eval "$(gnome-keyring-daemon --start)"
    export GNOME_KEYRING_CONTROL
    export SSH_AUTH_SOCK
  fi
fi

if lib::check_commands systemd-ask-password; then
  log::debug "Configuring gnome-keyring functions"

  my:gnome-keyring:unlock() {
    keyring_locked="$(
      qdbus \
      org.gnome.keyring \
      /org/freedesktop/secrets/collection/login \
      org.freedesktop.Secret.Collection.Locked
    )"
    if [[ $keyring_locked == "true" ]]; then
        systemd-ask-password | unlock.py
    fi
  }
fi
