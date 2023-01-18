# +=========================+
# | Aliases and functions   |
# +-------------------------+

insist() {
    local delay=1
    local cmd
    cmd="$(fc -ln | tail -1)"
    log::info "Insisting on: $cmd"
    until eval "$cmd"; do
        sleep "$delay"
    done
}

function mcd() {
    if [ -d "$1" ]; then
        log::info "$1 exists"
    else
        mkdir -p "$1"
        log::info "$1 created"
    fi
    cd "$1" || exit
}

# To use `sudo` with aliases
alias sudo='sudo '

alias lsblk+='lsblk -o "NAME,MAJ:MIN,RM,SIZE,RO,FSTYPE,MOUNTPOINT,UUID"'

if lib::check_commands exa; then
    alias ls='exa'
    alias l='ls -l --group-directories-first --git' # --color-scale (has issues on white background)
    alias la='l -a'
    alias lt='la -s newest'
fi

if lib::check_commands bat; then
    alias cat='bat'
    alias caty='bat -lyaml'
fi

if lib::check_commands terraform; then
    alias tf="terraform"
fi

if lib::check_commands openstack; then
    alias os="openstack"
fi

if lib::check_commands rsync; then
    alias cp="rsync --archive --human-readable --partial --progress"
fi

if lib::check_commands kubectl; then
    alias k="kubectl"
    alias kd="kubectl describe"
    alias kgy="kubectl get -oyaml"
    alias kga="kubectl get -A"
fi

if lib::check_commands kubie; then
    alias kc="kubie ctx"
    alias kn="kubie ns"
fi

if lib::check_commands emacs emacsclient; then
    ec() {
        emacs "$@" </dev/null &>/dev/null &
        disown
    }

    alias ecc="emacsclient -nc"
fi

if lib::check_commands trans; then
    alias tru='trans -j en:ru'
    alias ten='trans -j ru:en'
    alias пер='trans -j ru:en'

    alias truen='trans -j ru:en'
    alias tenru='trans -j en:ru'

    alias tende='trans -j en:de'
    alias tdeen='trans -j de:en'

    alias trude='trans -j ru:de'
    alias tderu='trans -j de:ru'
fi

if lib::check_commands timew; then
    alias tt='timew'
fi

if lib::check_commands curl; then
    alias wanip='curl -s https://ipinfo.io/ip'
fi

if lib::check_commands ffmpeg; then
    alias ffprobe='ffprobe -hide_banner'
    alias ffmpeg='ffmpeg -hide_banner'
fi

if [[ ! ${commands[pbcopy]} ]]; then
    alias pbcopy="xclip -selection c"
    alias pbpaste="xclip -selection clipboard -o"
fi

if lib::check_commands fzf rg; then
    function frg() (
        rg "$@" --files-with-matches |
            fzf --preview "rg --color always -A5 -B5 \"$*\" {}"
    )
fi

if lib::check_commands alacritty-colorscheme fzf exa bat; then
    function chct() (
        local alclr=alacritty-colorscheme
        $alclr list |
            fzf "$@" --preview "
              $alclr apply {}
              bat --color=always --plain --line-range 52:68 ~/.zshrc
              echo
              exa -l /tmp"
    )
fi

# Deprecated aliases
#alias gmerge='( read branch && git pull && git merge origin/$branch -m "Merge $branch → $(git symbolic-ref --short -q HEAD)" && git push ) <<<'
#alias gship='( read branch && gmerge $branch && git push origin :$branch ) <<<'
#alias cpdiff='git diff --color | iconv -f cp1251 -t utf8 | less -r'
