""
"" .vimrc
""

" PLUGINS {{{
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'wavded/vim-stylus'
Plug 'vim-scripts/AnsiEsc.vim'
call plug#end()
"}}}

" basics {{{
set t_Co=256            " set 256 color
set nocompatible        " use Vim defaults
colorscheme onedark     " set colorscheme
set showmatch           " show matching brackets (),{},[]
set mat=5               " show matching brackets for 0.5 seconds
set nu rnu              " show hybrid line numbers
set shortmess=atI       " set shortmessages
set modeline            " use modelines
set laststatus=2
"}}}
" 24-bit color {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
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
" scroll one screen line regardless of editor line length with arrow keys{{{
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
map <leader>li o\begin{itemize}\end{itemize}ko\item 
map <leader>le o\begin{enumerate}\end{enumerate}ko\item 
map <leader>ld o\begin{description}\end{description}ko\item 
map <leader>lfr o\begin{frame}{}\end{frame}k$i
map <leader>lfi o\begin{figure}\centering\includegraphics[width=0.8\textwidth]{images/}\caption{}\label{}\end{figure}k$i
map <leader>lc o\begin{columns}\begin{column}{.5\textwidth}\end{column}\begin{column}{.5\textwidth}\end{column}\end{columns}4k$o
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
map <leader>nt :Exp ~/devel/netrunner/test/clj/game_test<cr>
map <leader>nn :Exp ~/devel/netrunner/src/clj/game<cr>
map <leader>np A(println (prompt-fmt :runner))(println (clojure.string/join "\n" (map :text (:log @state))))Vk=
"}}}

" Plugin Settings {{{
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 1

let g:airline_theme='onedark'
"}}}
" Rainbow Parentheses {{{
let g:rainbow_active = 0
map <leader>rp :RainbowToggle<CR>
autocmd BufEnter *.clj RainbowToggleOn
nmap <leader>ut :UndotreeToggle<CR>
"}}}
" Gutentags + Tagbar {{{
nmap <leader>tt :TagbarToggle<CR><C-W>l
let g:tagbar_autoclose = 1
let g:gutentags_cache_dir = "~/.vim-cache/tags"
"}}}
" NERD Commenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"}}}
"}}}

"vim: set ts=4 sw=4 sts=4 ai et fdm=marker:
