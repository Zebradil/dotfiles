# My dotfiles

A collection of configuration files applied by [chezmoi].

## Quick start

```shell
# Install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

```shell
# Update
chezmoi update
```

## Encryption

Some files are encrypted with a GPG key.
It should be present in the gpg-agent.

## Manual configuration

Chezmoi manages state only in the home directory,
but some parts of the configuration require changes outside of the home directory.
This can be solved with [scripts](https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/),
but until it is implemented, follow the instructions in this section.

### LightDM wallpaper

This configuration bundle uses lightdm and lightdm-slick-greeter. Use `lightdm-settings` for configuration and setting
wallpaper. There should be a way to set wallpaper on per-user basis via AccountsService and dbus (in this case "Draw
user backgrounds" can be set to `true`). But I haven't looked into this yet.

Instead, variety [is configured](https://github.com/Zebradil/dotfiles/blob/380fcaa817738056ce83cc7beb730de08663348c/src/private_dot_config/variety/scripts/executable_set_wallpaper#L289-L291)
to copy selected wallpaper to `/usr/local/share/backgrounds/wallpaper.jpg`. The file and the directory should be
writeable for the current user and readable for the lightdm user. Additionally, lightdm should be configured to use this
file as a wallpaper (refer to `lightdm-settings` or reuse [`slick-greeter.conf`](./snippets/slick-greeter.conf)).

```shell
# Create a directory for wallpapers.
# Set appropriate permissions and ownership.
# Here `users` group have write access, everyone can read.

WP_DIR=/usr/local/share/backgrounds
sudo mkdir --parents --mode=775 "$WP_DIR"
sudo chown :users "$WP_DIR"
```

### PAM U2F (using smart cards)

A smart card, like YubiKey can be used to perform 2FA in addition to password authentication or to perform passwordless
authentication.

In essence, passwordless authentication is achieved by using `sufficient` mode. 2FA is achieved by using `required`.

#### Passwordless login and sudo

Required [keys file](./src/private_dot_config/Yubico/encrypted_u2f_keys.asc) is set up by chezmoi.
Use `pamu2fcfg` in order to update the keys file or to create a new one
([instructions](https://github.com/Yubico/pam-u2f#registration)).

Make sure `pam_u2f` is installed:

```shell
sudo pacman -S --needed pam_u2f
```

Add the following line to the corresponding system PAM configuration files (replace ORIGIN and APP_ID with desired
values, they should match the values used by `pamu2fcfg` to create the keys file):

```shell
auth  sufficient  pam_u2f.so cue origin=pam://ORIGIN appid=pam://APP_ID
```

Optionally, enable debug logging by using the following line instead:

```shell
auth  sufficient  pam_u2f.so cue debug origin=pam://ORIGIN appid=pam://APP_ID
```

The new line should go before any other line starting with `auth` in the following files:

- `/etc/pam.d/sudo`
- `/etc/pam.d/lightdm`

Example for `sudo` (`MY_HOSTNAME` should be changed):

```
#%PAM-1.0

auth		sufficient	pam_u2f.so cue origin=pam://MY_HOSTNAME appid=pam://MY_HOSTNAME
auth		include		system-auth
account		include		system-auth
session		include		system-auth
```

[chezmoi]: https://chezmoi.io
