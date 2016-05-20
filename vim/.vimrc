set nocompatible

" leader
let mapleader = ","

" search
set hlsearch

" files
filetype plugin indent on

" check for uninstalled bundles at startup
NeoBundleCheck

" appearance
set relativenumber
set number
set cursorline
set colorcolumn=80

" indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" syntax and colorscheme
set background=dark
syntax on

" mouse
set ttyfast
set mouse=a
set ttymouse=urxvt

" cursors
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
