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
