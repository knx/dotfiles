call plug#begin('~/.vim/plugged')

" UI
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails', {'for':['ruby', 'haml']}

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()                   " required

" UI
set autoread                      " watch for file changes
set autoindent
set noswapfile                    " disable swapfiles
set nobackup                      " disable backups
set backupdir=$HOME/.vim/backup   " Directories for swp files
set showmatch                     " show matching brackets.
set showcmd                       " shows what you're typing as a command
set wildmenu
set timeoutlen=1000 ttimeoutlen=0 " eliminating esc delays
set shortmess+=I                  " no welcome message
set nolazyredraw
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1
set mouse=a
"set clipboard=unnamed
" set relativenumber

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

" Set tags directory  
set tags=./tags

" Removes highlight of your last search
nmap <C-c> :nohl<CR>
vmap <C-c> v:nohl<CR>
imap <C-c> <Esc>:nohl<CR>

" ctrl-x to close window
nmap <C-x> :close<CR>

" ctrl-s to save all
inoremap <c-s> <Esc>:wa!<CR>
vnoremap <c-s> v:wa!<CR>
noremap <c-s> :wa!<CR>

" tabs
map <c-t> :tabnew<CR>
noremap <tab> :tabnext<CR>
noremap <s-tab> :tabprevious<CR>

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
autocmd BufWritePre *.yml :%s/\s\+$//e

" Disable syntax highlight for files larger than 50 MB
autocmd BufWinEnter * if line2byte(line("$") + 1) > 50000000 | syntax clear | endif
"
" Enable python
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'

" DelimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_fastbrowse = 2

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_completion_start_length=2
let deoplete#tag#cache_limit_size = 50000000
" let g:deoplete#omni#input_patterns.ruby =
		\ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'tag', 'omni']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips', 'tag']
let g:deoplete#sources.vim  = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'file', 'omni', 'ultisnips', 'tag']
let g:deoplete#sources.scss = ['buffer', 'file', 'omni', 'ultisnips', 'tag']
let g:deoplete#sources.javascript = ['buffer', 'member', 'file', 'ultisnips', 'tag']
let g:deoplete#sources.coffee = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']
let g:deoplete#sources.haml = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']
let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']

" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType css,scss,sass,html,haml setlocal iskeyword+=-

" UltiSnips config
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Disable built-in cx-ck to be able to go backward
" inoremap <C-x><C-k> <NOP>
" let g:UltiSnipsExpandTrigger='<C-j>'
" let g:UltiSnipsListSnippets='<C-s>'
" let g:UltiSnipsJumpForwardTrigger='<C-j>'
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'

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
let g:neomake_coffeescript_coffeelint_maker = { 'args': ['--file ~/.coffelintrc'] }
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_open_list = 0

:silent! colorscheme gruvbox
set background=dark

" UI tweaks
" get rid of window split separator char
set fillchars+=vert:\ ,stlnc:\ 
" hide tildes on blank lines
highlight EndOfBuffer ctermfg=bg ctermbg=bg
