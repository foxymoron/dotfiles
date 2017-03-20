# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if init script doesn't exist
if ! zgen saved; then
    # prezto
    zgen prezto syntax-highlighting color 'yes'
    zgen prezto terminal auto-title 'yes'
    zgen prezto pacman frontend 'yaourt'
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto archive
    zgen prezto terminal
    zgen prezto pacman

    # additional plugins
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips
    zgen load marzocchi/zsh-notify
    zgen load zuxfoucault/colored-man-pages_mod
    zgen load jsks/czhttpd

    # themes
    zgen load molovo/filthy
    zgen load tylerreckart/odin

    zgen save
fi

# load additional zsh configuration
ZSH_CONFIG_DIR="$HOME/.config/zsh"
source $ZSH_CONFIG_DIR/aliases.zsh

# prompt
promptinit
prompt filthy

# colourscheme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark

# variables
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/

# load virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# load ssh-keys
# TODO: use gpg for handling keys
eval $(keychain --eval --quiet --confhost)

# load fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# path
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin:/home/jait/dev/bin/
