call plug#begin('~/.vim/plugged')

" UI
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'prurigro/vim-polyglot-darkcloud'
" Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
" Plug 'posva/vim-vue'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', {'for':['ruby', 'haml', 'yaml']}
" Plug 'ruby-formatter/rufo-vim', {'for':['ruby']}

" Colorschemes
Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'

call plug#end()                   " required

" UI
set autoread                      " watch for file changes
set autoindent
set noswapfile                    " disable swapfiles
set nobackup                      " disable backups
set backupdir=$HOME/.vim/backup   " Directories for swp files
set showmatch                     " show matching brackets.
set wildmenu
set timeoutlen=1000 ttimeoutlen=0 " eliminating esc delays
set shortmess+=I                  " no welcome message
set nolazyredraw
set noshowmode
set noshowcmd                     
set laststatus=2
"let g:rehash256 = 1
set mouse=a
" set relativenumber
set noruler

" Clipboard
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }
set clipboard=unnamed

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

" Set tags file  
set tags=./tags

" neovim live subsitution
set inccommand=nosplit

" Removes highlight of your last search
nmap <C-c> :nohl<CR>
vmap <C-c> v:nohl<CR>
imap <C-c> <Esc>:nohl<CR>

" ctrl-x to close window
nmap <C-x> :wq<CR>

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

" Enable python
" let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/Users/knx/.pyenv/shims/python'

" Deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_completion_start_length = 2
" let g:deoplete#auto_complete_delay = 1000
" let deoplete#tag#cache_limit_size = 50000000
" let g:deoplete#sources={}
" let g:deoplete#sources._    = ['buffer', 'file', 'tag', 'omni']
" let g:deoplete#sources.ruby = ['tag', 'buffer', 'member', 'file', 'ultisnips', 'omni']
" let g:deoplete#sources.vim  = ['buffer', 'file', 'ultisnips']
" let g:deoplete#sources.css  = ['buffer', 'file', 'omni', 'ultisnips', 'tag']
" let g:deoplete#sources.scss = ['buffer', 'file', 'omni', 'ultisnips', 'tag']
" let g:deoplete#sources.javascript = ['buffer', 'member', 'file', 'ultisnips', 'tag']
" let g:deoplete#sources.coffee = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']
" let g:deoplete#sources.haml = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']
" let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips', 'tag']
" let g:deoplete#sources#omni#input_patterns = {
" \   "ruby" : ['[^. *\t]\.\w*\|\h\w*::', '[a-zA-Z_]\w*::']
" \}
" call deoplete#custom#source('buffer', 'rank', 501)

" vue 
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" " use tab
" imap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}

" inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" filetypes
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=!
autocmd FileType css,scss,sass,html,haml setlocal iskeyword+=-
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,vue setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
set omnifunc=syntaxcomplete#Complete

" Fix syntax in vue files
autocmd FileType vue syntax sync fromstart

" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 2000
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_sign_info = ''
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_completion_enabled = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
" let g:ale_linters = {'coffee': ['coffeelint'] }
" " let b:ale_linters = {'javascript': ['eslint']}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'ruby': ['rubocop']
" \}
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

nmap <leader>rc :ALEFix<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Devicons
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''

let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'vim-symbol': ''
      \ },
      \ 'component_function': {
      \   'gitbranch': 'MyGitString',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyGitString()
  return strlen(gitbranch#name()) > 0 ? ' ' . gitbranch#name() : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" DelimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
"let g:netrw_fastbrowse = 2

" FZF
" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_nvim_statusline = 0

" noremap <c-f> :Files `git rev-parse --show-toplevel`<CR>
noremap <c-f> :GitFiles<CR>
noremap <c-d> :Files<CR>
noremap <c-h> :History<CR>

:silent! colorscheme gruvbox
" :hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" :hi TabLine ctermfg=Blue ctermbg=Yellow
" :hi TabLineSel ctermfg=Red ctermbg=Yellow
" set background=dark
" hide tildes on blank lines
highlight EndOfBuffer ctermfg=bg ctermbg=bg
"set eventignore=CursorMoved
