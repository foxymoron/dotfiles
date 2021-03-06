" python
let g:python_host_prog = '/home/jait/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/jait/.virtualenvs/neovim3/bin/python'

call plug#begin('~/.vim/plugged')
" basics
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot', { 'do': 'build' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-startify' " fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" themes
Plug 'chriskempson/base16-vim'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" neomake
Plug 'neomake/neomake'
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tweekmonster/deoplete-clang'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" frontend
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" latex
Plug 'lervag/vimtex'
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
set showcmd
set wildmenu

" search
set incsearch
set hlsearch
nnoremap <F3> :nohlsearch<CR>

" folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

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
au FileType vim setl sw=2 sts=2 ts=2
au FileType tex setl sw=4 sts=4 ts=4

" syntax and colourscheme
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night

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
nnoremap <F8> :TagbarToggle<CR>

" nerdcommenter
let g:NERDTrimTrailingWhitespace=1
let g:NERDCommentEmptyLines=1

" omni
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" deoplete
let g:deoplete#enable_at_startup = 1
" use smartcase
let g:deoplete#enable_smart_case = 1
" deoplete-clang
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/include/clang'
let g:deoplete#sources#clang#flags = ['-std=c++11']
" deoplete-tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = ['jsx', 'javascript.jsx']

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

" vim-jsx
let g:jsx_ext_required = 0

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

" vimtex
let g:vimtex_view_method = 'zathura'

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ['-std=c++11', '-Wextra', '-Wall']
autocmd! BufWritePost * Neomake

" startify
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = ['sessions', 'files', 'dir']

" local vimrc
set exrc
set secure

" make
nnoremap <F4> :make!<CR>

" mouse
set mouse=a

