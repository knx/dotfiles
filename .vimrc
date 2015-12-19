call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'benekastah/neomake'
Plug 'kien/ctrlp.vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

call plug#end()            " required

" UI
set autoread        " watch for file changes
set autoindent
set noswapfile      " disable swapfiles
set nobackup        " disable backups
set backupdir=$HOME/.vim/backup " Directories for swp files
set showmatch       " show matching brackets.
set showcmd         " shows what you're typing as a command
set wildmenu
set timeoutlen=1000 ttimeoutlen=0 " eliminating esc delays
set shortmess+=I    " no welcome message
set lazyredraw

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

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> v:nohl<CR>
inoremap <C-n> <Esc>:nohl<CR>

" ctrl-s to save
inoremap <c-s> <Esc>hh:wa!<CR>
vnoremap <c-s> v:wa!<CR>
noremap <c-s> :wa!<CR>

"tab/buffers switching
function! Tabbufn()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bn
    else
        :tabnext
    endif
endfunction

function! Tabbufp()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bp
    else
        :tabprev
    endif
endfunction

noremap <c-[> :call Tabbufp()<CR>
noremap <c-]> :call Tabbufn()<CR>

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='powerlineish'
set laststatus=2

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_fastbrowse = 2

" CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git\|tmp\|^log\|bundle\|.git\|uploads\|vendor\|public\|.un~'
let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 5 -g ""'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_mruf_max = 50
let g:ctrlp_mruf_default_order = 1
let g:ctrlp_cmd = 'CtrlPMRU'

"NeoMake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

set background=dark
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1
set mouse=a
set clipboard=unnamed
:silent! colorscheme atom-dark-256
