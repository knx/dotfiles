set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-vinegar'
"Plug 'elzr/vim-json'
"Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
"Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-haml'
"Plug 'tpope/vim-markdown'
"Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'honza/vim-snippets'

call plug#end()            " required
filetype plugin indent on    " required

" UI
set encoding=utf-8
"set number          " show line number
set autoread        " watch for file changes
set autoindent
set noswapfile      " disable swapfiles
set nobackup        " disable backups
set backupdir=$HOME/.vim/backup " Directories for swp files
set showmatch       " show matching brackets.
set showcmd         " shows what you're typing as a command
set wildmenu
set ttyfast         " faster redraw
set timeoutlen=1000 ttimeoutlen=0 " eliminating esc delays
set shortmess+=I    " no welcome message
set lazyredraw
"set ruler

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch        " highlight all matches
set incsearch       " do incremental searching
set ignorecase      " ignore case when searching
set smartcase
set gdefault
" use normal regex for search
nnoremap / /\v
vnoremap / /\v

" Folding
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za     
" use space to toggle folds
set foldlevelstart=10   " start with fold level of 1

" persistent undo
if exists("&undodir")
  set undofile          "Persistent undo! Pure money.
  let &undodir=&directory
  set undolevels=500
  set undoreload=500
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remap jj to escape in insert mode.  You'll never type jj anyway!
inoremap jj <Esc>hh
noremap <C-n> :nohl<CR>
" Removes highlight of your last search
vnoremap <C-n> v:nohl<CR>
inoremap <C-n> <Esc>:nohl<CR>

" ctrl-s to save
inoremap <c-s> <Esc>hh:wa!<CR>
vnoremap <c-s> v:wa!<CR>
noremap <c-s> :wa!<CR>

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif

" Airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='powerlineish'
set laststatus=2

" CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git\|tmp\|^log\|bundle\|.git\|uploads\|vendor\|public\|.un~'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set background=dark
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1
set mouse=a

:silent! colorscheme atom-dark-256
syntax on
