# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if init script doesn't exist
if ! zgen saved; then
    # prezto
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto archive
    zgen prezto directory
    zgen prezto environment
    zgen prezto terminal
    zgen prezto pacman
    zgen prezto utility
    zgen prezto node
    zgen prezto syntax-highlighting color 'yes'
    zgen prezto node:nvm auto-switch 'yes'
    zgen prezto terminal auto-title 'yes'
    zgen prezto pacman frontend 'yaourt'
    zgen prezto editor key-bindings 'vi'
    zgen prezto '*:*' color 'yes'

    # additional plugins
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips
    zgen load marzocchi/zsh-notify
    zgen load zuxfoucault/colored-man-pages_mod
    zgen load Tarrasch/zsh-autoenv

    # themes
    zgen load molovo/filthy

    zgen save
fi

# load additional zsh configuration
ZSH_CONFIG_DIR="$HOME/.config/zsh"
source $ZSH_CONFIG_DIR/aliases.zsh

# prompt
promptinit
prompt agnoster

# colourscheme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_tomorrow-night

# variables
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/

# load virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# load ssh-keys
# TODO: use gpg for handling keys
eval $(keychain --eval --quiet --confhost)

# load fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# path
export PATH=$PATH:/usr/lib/erlang/man:$(ruby -e 'print Gem.user_dir')/bin:/home/jait/dev/bin/:$HOME/.cargo/bin

# editor
export EDITOR=nvim
