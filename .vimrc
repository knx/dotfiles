call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
" Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-vinegar'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax', {'for':['scss']}
Plug 'kchmck/vim-coffee-script', {'for':['coffee']}
" Plug 'pangloss/vim-javascript', {'for':['javascript']}
"Plug 'othree/javascript-libraries-syntax.vim', {'for':['javascript', 'coffee']}
Plug 'tpope/vim-haml', {'for':['haml']}
Plug 'tpope/vim-rails', {'for':['ruby', 'haml']}
Plug 'vim-ruby/vim-ruby', {'for':['ruby']}
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

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
set laststatus=2
set background=dark
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1
set mouse=a
set clipboard=unnamed
"set relativenumber
" if has('gui_macvim')
"   set guifont=Roboto Mono Light for Powerline:h14
" endif

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Removes highlight of your last search
nmap <C-c> :nohl<CR>
vmap <C-c> v:nohl<CR>
imap <C-c> <Esc>:nohl<CR>

" ctrl-s to save all
inoremap <c-s> <Esc>:wa!<CR>
vnoremap <c-s> v:wa!<CR>
noremap <c-s> :wa!<CR>

" fix double quotes
noremap <leader>' :%s/"/'/<CR>:nohl<CR>
vnoremap <leader>' v:%s/"/'/<CR>:nohl<CR>
inoremap <leader>' <Esc>:%s/"/'/<CR>:nohl<CR>

" convert vim buffer to haml/html
nmap <leader>h :%!html2haml --erb 2> /dev/null<CR>:set ft=haml<CR>
vmap <leader>h :!html2haml --erb 2> /dev/null<CR>

" input newline without entering insert
nmap <CR> i<CR><Esc>

" :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Auto remove whitespace on save
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e

" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif

" Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='powerlineish'

" DelimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1

" Netrw
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_fastbrowse = 2

" CtrlP
let g:ctrlp_custom_ignore = 'DS_Store\|git\|tmp\|^log\|bundle\|.git\|uploads\|vendor\|public\|.un~'
let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 5 -g ""'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_mruf_max = 50
let g:ctrlp_mruf_default_order = 1
let g:ctrlp_cmd = 'CtrlPMRU'

" NeoMake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_coffeescript_coffeelint_maker = {
    \ 'args': ['--file ~/.coffelintrc'],
    \ }
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_open_list = 0

" neovim configs
if has("nvim")
  " vim-test maps
  map <silent> <leader>t :TestNearest<CR>
  map <silent> <leader>f :TestFile<CR>
  map <silent> <leader>T :TestSuite<CR>
  map <silent> <leader>r :TestLast<CR>
  map <silent> <leader>g :TestVisit<CR>

  " run tests with :T
  let test#strategy = "neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_position = "vertical"
  let g:neoterm_close_when_tests_succeed = 0

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>
endif


" Syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'reek']

:silent! colorscheme atom-dark-256
