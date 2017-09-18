set nocompatible

" filetype
filetype plugin indent on

" omnifunc
set omnifunc=syntaxcomplete#Complete

" leader
let mapleader=' '

" whitespace
set backspace=indent,eol,start
set listchars=tab:>·,trail:~,extends:❯,precedes:❮,space:␣
set shiftround
let &showbreak='↪'

" buffers
set hidden

"faster redrawing
set ttyfast

" appearance
set number
set relativenumber
set cursorline
set colorcolumn=80
set showcmd
set wildmenu

" cursors
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" syntax and colourscheme
syntax on
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night

packadd minpac
call minpac#init()

" search
set incsearch
set hlsearch
nnoremap <F3> :nohlsearch<CR>

" movement
nnoremap j gj
nnoremap k gk
nnoremap <UP> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" indent
set autoindent
set smartindent
set expandtab
set sw=4
set sts=4
set ts=4
au FileType vim setl sw=2 sts=2 ts=2
au FileType javascript setl sw=2 sts=2 ts=2
au FileType javascript.jsx setl sw=2 sts=2 ts=2
au FileType cpp setl sw=2 sts=2 ts=2

" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeIgnore=['\.git', '\.hg', '\.o$[[file]]']
nnoremap <leader>ft :NERDTreeToggle<cr>

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" fzf
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
" fzf ag embellishments
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)
" fzf shortcuts
nnoremap <leader>ff :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>gt :Tags<CR>
nnoremap <leader><leader> :Ag<CR>

" gitgutter
"let g:gitgutter_realtime=0
"let g:gitgutter_eager=0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" shortcuts
nnoremap <leader><tab> <C-^>
nnoremap <F8> :TagbarToggle<CR>

" local vimrc
set exrc
set secure

" make
nnoremap <F4> :make!<CR>

" mouse
set mouse=a

" completor
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_node_binary = '/usr/bin/node'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

" packages
" basics
call minpac#add('majutsushi/tagbar')
call minpac#add('scrooloose/nerdtree')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('airblade/vim-gitgutter')
" themes
call minpac#add('chriskempson/base16-vim')
" lightline
call minpac#add('itchyny/lightline.vim')
" fzf
call minpac#add('junegunn/fzf.vim')
" completion
call minpac#add('maralla/completor.vim')

" minpac shortcuts
command! PacUpdate call minpac#update()
command! PacClean call minpac#clean()

" fix path for fzf
set runtimepath^=~/.fzf
runtime plugin/fzf.vim

" formatting
autocmd FileType c, cpp setlocal equalprg=clang-format
