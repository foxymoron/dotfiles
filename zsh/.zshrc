# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if init script doesn't exist
if ! zgen saved; then
    # prezto
    zgen prezto syntax-highlighting color 'yes'
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto completion

    # additional plugins
    zgen load rimraf/k
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips
    zgen load marzocchi/zsh-notify

    # themes
    zgen load molovo/filthy
    zgen load tylerreckart/odin

    zgen save
fi

promptinit
prompt agnoster

alias vim=nvim
alias hdmi='screenchange -1 HDMI1 -2 LVDS1 -m'
alias vga='screenchange -1 VGA1 -2 LVDS1 -m'
alias reset='xrandr --auto'
alias monitor-off='xrandr --output VGA1 --off;xrandr --output HDMI1 --off'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

base16_default-dark

eval $(keychain --eval --quiet --confhost)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
