call plug#begin('~/.vim/plugged')
" basics
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' 
" themes
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/wombat256.vim'
Plug 'dikiaap/minimalist'
Plug 'dylanaraps/crayon'
Plug 'chriskempson/base16-vim'
Plug 'bitterjug/vim-colors-bitterjug'
Plug 'Zenburn'
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim'
Plug 'zchee/deoplete-jedi'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" frontend
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'coffee', 'ls', 'typescript'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml', 'javascript'] }
" neomake
Plug 'neomake/neomake'
call plug#end()

" filetype
filetype plugin indent on

" leader
let mapleader=' '

" cursors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" whitespace
set backspace=indent,eol,start
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
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

" indent
set autoindent
set smartindent
set expandtab 

" syntax and colourscheme
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeIgnore=['\.git', '\.hg']
nnoremap <leader>ft :NERDTreeToggle<cr>

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_theme='base16_default'

" deoplete
let g:deoplete#enable_at_startup=1
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum='0' " disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" indentation
au FileType javascript setl sw=2 sts=2
au FileType python setl ts=4 sw=4 sts=4

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" indentline
let g:indentLine_char='│'
let g:indentLine_color_term=239

" fzf
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'
let g:fzf_colors = { 
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1

" vim jsx
let g:jsx_ext_required = 0

" js libs
let g:used_javascript_libs = 'react'

" This to close preview when insert mode leaves
autocmd CompleteDone * pclose

" gitgutter
let g:gitgutter_realtime=0
let g:gitgutter_eager=0

" shortcuts
nnoremap <leader><tab> <C-^>
nnoremap <leader>f :Files<CR>
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>pt :Tags<CR>

" neomake
let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost * Neomake

" nerdcommenter
let g:NERDTrimTrailingWhitespace=1
let g:NERDCommentEmptyLines=1
