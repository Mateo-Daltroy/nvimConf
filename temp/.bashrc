# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

PS1='[\u_\W]$ '

export EDITOR="nvim"

# Yazi cambia de directorio con el movimiento
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Basics
alias "la"="ls -a"
alias "lal"="ls -l -a"
alias "ll"="ls -l"
alias "c"="clear"
alias "n"="nvim"
alias "vim"="nvim"
alias "q"="exit"
alias "off"="init 0"
alias ".."="cd .."

#Applications
alias "obsi"="flatpak run md.obsidian.Obsidian &"
alias "spot"="flatpak run com.spotify.Client &"
alias "wpp"="chromium-browser --app=https://web.whatsapp.com/ &"
alias "disc"="flatpak run com.discordapp.Discord"
alias "open"="xdg-open"
alias "o"="opencode"

# Alias especificos del semestre actual
alias "gsmo"="cd ~/Facultad/3ro/OO2/"
alias "gsmi"="cd ~/Facultad/4to/Inge3/"
alias "gsmr"="cd ~/Facultad/3ro/Redes_2do/"
alias "gsmc"="cd ~/Facultad/3ro/CPLP/"
# Alias para soporte de typos
alias "gmso"="cd ~/Facultad/3ro/OO2/"
alias "gmsi"="cd ~/Facultad/4to/Inge3/"
alias "gmsr"="cd ~/Facultad/3ro/Redes_2do/"
alias "gmsc"="cd ~/Facultad/3ro/CPLP/"

# Change bash
alias "cbash"="nvim ~/.bashrc"
alias "sbash"="source ~/.bashrc"
PATH=/home/daltroy/.local/bin:/home/daltroy/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/go/bin:/home/daltroy/go/bin

# pnpm
export PNPM_HOME="/home/daltroy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
