# borrowed from github.com/ivyl/zsh-config

# ls
alias l='ls -lFh'
alias la='ls -lAFh'

# editors
alias e='nvim'
alias vim='nvim'
alias vi='nvim'

# screenchange
alias hdmi='screenchange -1 HDMI1 -2 LVDS1 -m'
alias vga='screenchange -1 VGA1 -2 LVDS1 -m'
alias reset='xrandr --auto'
alias monitor-off='xrandr --output VGA1 --off;xrandr --output HDMI1 --off'
