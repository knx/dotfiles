set nocompatible              " required
filetype off                  " required

set rtp+=$HOME/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'   " let Vundle manage Vundle, required
" utils
Plugin 'bling/vim-airline'
"Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tomtom/tcomment_vim'
"Plugin 'tpope/vim-surround'
"Plugin 'rizzatti/dash.vim'
"Plugin 'edkolev/tmuxline.vim'

" languages
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" snippets
Plugin 'honza/vim-snippets'
"Plugin 'rcyrus/snipmate-snippets-rubymotion'
" themes
"Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

" UI
set encoding=utf-8
set number          " show line number
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

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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
nnoremap <space> za     " use space to toggle folds
set foldlevelstart=10   " start with fold level of 1


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remap jj to escape in insert mode.  You'll never type jj anyway!
inoremap jj <Esc>hh
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" ctrl-s to save
inoremap <c-s> <Esc>hh:wa!<CR>
vnoremap <c-s> v:wa!<CR>
noremap <c-s> :wa!<CR>

"rails shortcuts
nnoremap <leader>, :A<CR>

"tags search
nnoremap <leader>. :CtrlPTag<cr>

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
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

" Netrw
" hide files
let g:netrw_list_hide= '^\..*$'

" CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git\|tmp\|log\|bundle\|.git\|uploads\|vendor\|public'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set background=dark
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1

:silent! colorscheme atom-dark-256
syntax on
