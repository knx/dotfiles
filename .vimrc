call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
"Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
"Plug 'Shougo/deoplete.nvim'
Plug 'Raimondi/delimitMate'
Plug 'benekastah/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'garbas/vim-snipmate'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax', {'for':['scss']}
Plug 'kchmck/vim-coffee-script', {'for':['coffee']}
Plug 'pangloss/vim-javascript', {'for':['javascript']}
Plug 'othree/javascript-libraries-syntax.vim', {'for':['javascript', 'coffee']}
Plug 'tpope/vim-haml', {'for':['haml']}
Plug 'tpope/vim-rails', {'for':['ruby', 'haml']}
Plug 'vim-ruby/vim-ruby', {'for':['ruby']}

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
noremap <C-c> :nohl<CR>
vnoremap <C-c> v:nohl<CR>
inoremap <C-c> <Esc>:nohl<CR>

" ctrl-s to save
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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='powerlineish'

"let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ]
"       \ },
"       \ 'component_function': {
"       \   'fugitive': 'LightLineFugitive',
"       \   'readonly': 'LightLineReadonly',
"       \   'modified': 'LightLineModified',
"       \   'filename': 'LightLineFilename',
"       \   'ctrlpmark': 'CtrlPMark'
"       \ },
"       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"       \ }

" function! LightLineModified()
"   if &filetype == "help"
"     return ""
"   elseif &modified
"     return "+"
"   elseif &modifiable
"     return ""
"   else
"     return ""
"   endif
" endfunction

" function! LightLineReadonly()
"   if &filetype == "help"
"     return ""
"   elseif &readonly
"     return "\ue0a2"
"   else
"     return ""
"   endif
" endfunction

" function! LightLineFugitive()
"   if exists("*fugitive#head")
"     let _ = fugitive#head()
"     let hunks = gitgutter#hunk#summary()
"     let hunk_symbols = ["+", "~", "-"]
"     let status = ''
"     if !empty(hunks)
"       for i in [0, 1, 2]
"         if hunks[i] > 0
"           let status .= printf('%s%s ', hunk_symbols[i], hunks[i])
"         endif
"       endfor
"     endif
"     return strlen(_) ? "\ue0a0 "._." ".status : ''
"   endif
"   return ''
" endfunction

" function! LightLineFilename()
"   return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction

" function! CtrlPMark()
"   if expand('%:t') =~ 'ControlP'
"     call lightline#link('iR'[g:lightline.ctrlp_regex])
"     return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
"           \ , g:lightline.ctrlp_next], 0)
"   else
"     return ''
"   endif
" endfunction

" let g:ctrlp_status_func = {
"   \ 'main': 'CtrlPStatusFunc_1',
"   \ 'prog': 'CtrlPStatusFunc_2',
"   \ }

" function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"   let g:lightline.ctrlp_regex = a:regex
"   let g:lightline.ctrlp_prev = a:prev
"   let g:lightline.ctrlp_item = a:item
"   let g:lightline.ctrlp_next = a:next
"   return lightline#statusline(0)
" endfunction

" function! CtrlPStatusFunc_2(str)
"   return lightline#statusline(0)
" endfunction

" set noshowmode

" SuperTab
"let g:SuperTabDefaultCompletionType = "context"


" Netrw
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
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_scss_enabled_makers = ['scsslint']
"let g:neomake_open_list = 2


set laststatus=2
set background=dark
set fillchars+=stl:\ ,stlnc:\
let g:rehash256 = 1
set mouse=a
set clipboard=unnamed
:silent! colorscheme atom-dark-256
