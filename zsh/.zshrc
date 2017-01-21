# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if init script doesn't exist
if ! zgen saved; then
    zgen prezto

    # plugins
    zgen prezto git
    zgen load rimraf/k
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load mollifier/anyframe
    zgen load hcgraf/zsh-sudo

    # filthy theme
    zgen load molovo/filthy

    zgen save
fi

promptinit
prompt filthy

alias vim=nvim
alias hdmi='screenchange -1 HDMI1 -2 LVDS1 -m'
alias vga='screenchange -1 VGA1 -2 LVDS1 -m'
alias reset='xrandr --auto'
alias monitor-off='xrandr --output VGA1 --off;xrandr --output HDMI1 --off'

eval $(keychain --eval --quiet --confhost)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
