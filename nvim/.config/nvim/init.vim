call plug#begin('~/.vim/plugged')
" basics
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-fswitch'
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
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" frontend
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'coffee', 'ls', 'typescript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'alvan/vim-closetag'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

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

" indent
set autoindent
set smartindent
set expandtab 
au FileType html setl sw=2 sts=2
au FileType javascript setl sw=2 sts=2
au FileType javascript.jsx setl sw=2 sts=2
au FileType json setl sw=2 sts=2
au FileType python setl ts=4 sw=4 sts=4
au FileType c setl noet sw=4 ts=4
au FileType cpp setl noet sw=4 ts=4
au FileType d setl sw=4 ts=4

" syntax and colourscheme
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

" NERDTree
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeIgnore=['\.git', '\.hg', '\.o$[[file]]']
nnoremap <leader>ft :NERDTreeToggle<cr>

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_theme='base16_default'

" deoplete
set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup=1
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum='0' " disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern#filetypes = ['jsx', 'javascript.jsx']
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/include/clang'

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" indentline
let g:indentLine_char='│'
let g:indentLine_color_term=239

" fzf
let g:fzf_buffers_jump=1
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
let g:fzf_nvim_statusline=0

" vim jsx
let g:jsx_ext_required = 0

" js libs
let g:used_javascript_libs = 'react'

" This to close preview when insert mode leaves
autocmd CompleteDone * pclose

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
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>bt :BTags<CR>
nnoremap <leader>bl :Lines<CR>
nnoremap <leader>btt :TagbarToggle<CR>

nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>pt :Tags<CR>
nnoremap <leader>pl :GGrep<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" neomake
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" nerdcommenter
let g:NERDTrimTrailingWhitespace=1
let g:NERDCommentEmptyLines=1

" fswitch
au! BufEnter *.c let b:fswitchdst = 'h'

" closetag
let g:closetag_filenames = "*.html,*.js,*.jsx"

" omni
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" tagbar
let g:tagbar_type_d = {
  \ 'ctagstype' : 'd',
  \ 'kinds'     : [
  \ 'c:classes:1:1',
  \ 'f:functions:1:1',
  \ 'T:template:1:1',
  \ 'g:enums:1:1',
  \ 'e:enumerators:0:0',
  \ 'u:unions:1:1',
  \ 's:structs:1:1',
  \ 'v:variables:1:0',
  \ 'i:interfaces:1:1',
  \ 'm:members',
  \ 'a:alias'
  \ ],
  \'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'g' : 'enum',
  \ 's' : 'struct',
  \ 'u' : 'union',
  \ 'T' : 'template'
  \ },
  \ 'scope2kind' : {
  \ 'enum'      : 'g',
  \ 'class'     : 'c',
  \ 'struct'    : 's',
  \ 'union'     : 'u',
  \ 'template'  : 'T'
  \ },
  \ 'ctagsbin' : 'dscanner',
  \ 'ctagsargs' : ['--ctags']
  \ }
