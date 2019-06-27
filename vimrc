""
"" .vimrc
""

" basics {{{
set t_Co=256            " set 256 color
set nocompatible        " use Vim defaults
colorscheme Tomorrow-Night    " define syntax color scheme
set showmatch           " show matching brackets (),{},[]
set mat=5               " show matching brackets for 0.5 seconds
set nu rnu              " show hybrid line numbers
set shortmess=atI       " set shortmessages
set modeline            " use modelines
set laststatus=2
"}}}
" wrap like other editors {{{
set wrap                " word wrap
set textwidth=0
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs
"}}}
" backup and undo settings {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undofile
set undodir=~/.vim-cache/undodir
"}}}
" tabs and indenting {{{
" modeline: vim: set ts=4 sw=4 sts=4 ai et fdm=marker:
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set expandtab           " use spaces instead of tabs
"}}}
" folding {{{
set foldmethod=marker   " Use {{{ }}} for folding
set foldnestmax=1       " Fold only on top level
"}}}
" searching {{{
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
"}}}
" Show tabs and trailing spaces {{{
set list
set listchars=tab:!·,trail:·
"}}}
" syntax highlighting {{{
syntax on               " enable syntax highlighting
"}}}
" fileencodings {{{
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,default,latin1
set tenc=utf-8
"}}}
" leader key Spacebar {{{
let mapleader=" "
"}}}
" Wurstfinger {{{
command W w
"}}}
" scroll one screen line regardless of editor line length {{{
:noremap    <Up> gk
:noremap!   <Up> <C-O>gk
:noremap    <Down> gj
:noremap!   <Down> <C-O>gj

:noremap    k gk
:noremap    j gj
"}}}
" Python {{{
let python_hightlight_all=1
filetype plugin on
filetype indent on
"}}}
" Tabs {{{
set tabpagemax=100
set hidden
map <leader>tn :Exp .<cr>
map <leader>tl :bn <cr>
map <leader>th :bp <cr>
map <leader>tc :bw <cr>
map <leader>t1 :bf<cr>
map <leader>t2 :bf<cr>:bn 1<cr>
map <leader>t3 :bf<cr>:bn 2<cr>
map <leader>t4 :bf<cr>:bn 3<cr>
map <leader>t5 :bf<cr>:bn 4<cr>
map <leader>t6 :bf<cr>:bn 5<cr>
map <leader>t7 :bf<cr>:bn 6<cr>
map <leader>t8 :bf<cr>:bn 7<cr>
map <leader>t9 :bf<cr>:bn 8<cr>
map <leader>t0 :bf<cr>:bn 9<cr>
"}}}
" Latex helpers {{{
map <leader>lg o\includegraphics[width=\textwidth]{images/}19hi
map <leader>li o\begin{itemize}
map <leader>le o\begin{enumerate}
map <leader>ld o\begin{description}
map <leader>lfr o\begin{frame}{}
map <leader>lfi o\begin{figure}
map <leader>lc o\begin{columns}
imap <c-l>mr \mathrm{}i
imap <c-l>ms \mathsf{}i
imap <c-l>mf \frac{}{}hhi
"}}}
" When working too much with Matlab... {{{
nmap <c-s> :w<CR>
imap <c-s> :w<CR>a
"}}}
" use l-; for deactivating search result highlighting {{{
noremap <leader>; :let @/ = "" <cr>
"}}}
" Disable scrollwheel in insert-mode {{{
imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
"}}}
" Tags {{{
noremap + <C-]>
"}}}
" Netrunner development {{{
map <leader>no mZ?deftest<cr>wi^:test-refresh/focus <esc>'ZmZ
map <leader>ni mZ?deftest<cr>wdf <esc>'ZmZ
"}}}

"" PLUGINS {{{
call plug#begin('~/.vim/plugged')
" Airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 1

let g:airline_theme='tomorrow'
"}}}
" Rainbow Parentheses {{{
Plug 'luochen1990/rainbow'

let g:rainbow_active = 0
map <leader>rp :RainbowToggle<CR>
autocmd BufEnter *.clj RainbowToggleOn
"}}}
" Gutentags + Tagbar {{{
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

nmap <leader>tt :TagbarToggle<CR><C-W>l
let g:tagbar_autoclose = 1
let g:gutentags_cache_dir = "~/.vim-cache/tags"
" nnoremap <C-]> <C-w><C-]><C-W>T
" vnoremap <C-]> <Esc><C-w><C-]><C-W>T
"}}}
" Signature (marks) {{{
Plug 'kshenoy/vim-signature'
" }}}
" NERD Commenter {{{
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"}}}
" undotree {{{
Plug 'https://github.com/mbbill/undotree.git'
nmap <leader>ut :UndotreeToggle<CR>
"}}}
call plug#end()
"}}}

"vim: set ts=4 sw=4 sts=4 ai et fdm=marker: