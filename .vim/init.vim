" Ryan McGowan's init.vim

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Make sure filetype is off for pathogen
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
if has("nvim")
  set backupdir=~/.config/nvim/backups
  set undodir=~/.config/nvim/undo
  execute pathogen#infect('bundle/{}', 'n-bundle/{}')
else
  set backupdir=~/.vim/backups
  set undodir=~/.vim/undo
  execute pathogen#infect('bundle/{}', 'v-bundle/{}')
endif

"Source matchit.vim (included in vim 7)
runtime macros/matchit.vim

if has("vms")
  set nobackup                " do not keep a backup file, use versions instead
else
  set backup                " keep a backup file
endif
set ruler                " show the cursor position all the time
set showcmd                " display incomplete commands
set incsearch                " do incremental searching

set printfont=Inconsolata\ 12

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
endif

set maxmempattern=9999

set colorcolumn=80
"Set our colorscheme
if has("gui_running")
  colorscheme solarized
  let g:powerline_config_overrides = {
        \   'ext': {
        \     'vim': {
        \       'colorscheme': 'solarized'
        \     }
        \   }
        \ }

  set noballooneval
  highlight Visual gui=NONE guifg=NONE guibg=#084250
  set cursorline
  set cursorcolumn
  highlight CursorColumn guibg=#062F39
  highlight CursorLine guibg=#06323D
  highlight SignColumn guibg=#073642
elseif &t_Co >= 256
  let g:seoul256_background = 234
  colorscheme seoul256

  let s:left_color = 16
  highlight Visual ctermbg=23
  highlight ColorColumn ctermbg=235
  highlight SignColumn ctermbg=235
  highlight LineNr ctermbg=235

  " Make highlighting better for git gutter
  highlight DiffAdd ctermfg=151 ctermbg=235
  highlight DiffChange ctermfg=172 ctermbg=235
  highlight DiffDelete ctermfg=160 ctermbg=235

  if &term == 'rxvt-unicode-256color'
    highlight Comment cterm=italic
    highlight String cterm=italic
  end
else
  colorscheme elflord
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

highlight! link CursorLineNr LineNr

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Run stastic automatically, even on scp files.
  "autocmd bufreadpost,bufwritepost * call s:UpdateErrors()

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window. Protect against
    " screwing up folding when switching between windows.
    au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END

  " Highlight trailing whitespace when not in insert-mode
  augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
  augroup END

  if exists("+omnifunc")
    au Filetype *
      \ if &omnifunc == "" |
      \         setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
  endif

  augroup cljs
    au!
    au BufReadPost,BufNewFile *.cljs setlocal filetype=clojure
  augroup END

  augroup sls
    au!
    au BufReadPost,BufNewFile *.sls setlocal filetype=yaml
  augroup END

  if has("nvim")
    augroup custom_neomake
      au!
      au BufWritePost * Neomake
    augroup END
  endif

  augroup writing
    autocmd!
    " autocmd FileType text,markdown,rst call pencil#init()
    "       \ | call litecorrect#init()
  augroup END
endif " has("autocmd")

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set encoding to utf-8
set encoding=utf-8

"Linebreak and Wrap
set wrap
set linebreak

"Some fun stuff which makes life easier
set number
set hidden
set history=1000
set undolevels=1000
set undoreload=10000
set undofile

set scrolloff=6 sidescrolloff=12
"Ignore case unless there's a capital
set ignorecase
set smartcase
"Split below and to the right instead of default
"set splitbelow "Makes MiniBufExplorer appear at the bottom
"set splitright
set title
" let loaded_matchparen = 0 "Uncomment to turn off
set showmatch

"Completeion in command mode
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,*.pyc,*node_modules*,*/venv/*,*/build/*
set wildmenu
set wildmode=list:longest,full

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Add charater to front of wrapped lines
set showbreak=↪

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Reselect visual block after indent/outdent
" vnoremap < <gv
" vnoremap > >gv

" Terminal Config
if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif

"
" Plugin Config

" Rainbow
let g:rainbow_active = 0
nmap <leader>r :RainbowToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Instant Markdown
" Do not enable by default
let g:instant_markdown_autostart = 0

" Limelight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Airline
let g:airline_powerline_fonts = 1

" minibufexpl
"let g:miniBufExplVSplit = 25
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplUseSingleClick = 1

" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
nmap <leader>y :YRShow<cr>

"Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

"Syntastic
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1 " Default is 2
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
"let g:syntastic_mode_map = { 'mode': 'active',
"\ 'passive_filetypes': ['haml', 'sass'] }
"let g:syntastic_quiet_warnings=1 "Breaks everything!
nnoremap <silent> <leader>se :Errors<CR>

" Autornu
let g:autornu_enable = 0
nnoremap <silent> <F3> :AutornuToggle<CR>
nnoremap <silent> <F4> :AutornuOnOff<CR>

"Vim clojure static
let g:clojure_align_multiline_strings = 0
" Set *.cljs files to the clojure filetype

let mapleader = '\'
" Paredit
let g:paredit_shortmaps = 1

" Fireplace (Clojure)
set viminfo+=! "Not actually a fireplace option, but presists cached cp
nnoremap <silent><buffer> cpR :Require!<CR>
let g:leiningen_no_auto_repl = 1

"Snipmate
inoremap <C-space> <Plug>snipMateNextOrTrigger
snoremap <C-space> <Plug>snipMateNextOrTrigger

"Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>a/ :Ack!<space>
nnoremap <leader>a* :Ack! -w <C-R><C-W><space>
nnoremap <leader>aa :AckAdd<space>

" Open and close the location and quickfix list
nmap <leader>cc :cclose<CR>
nmap <leader>co :copen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>lo :lopen<CR>

" QFS or GitGutter
nnoremap <leader>gg :GitGutterToggle<CR>
let g:gitgutter_sign_modified = 'Δ'

nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk

let g:gitgutter_sign_modified_removed = 'Δ_'
"let g:gitgutter_diff_args = '-w'
highlight! link GitGutterAdd GitGutterAddLine
highlight! link GitGutterChange GitGutterChangeLine
highlight! link GitGutterChangeDelete GitGutterChangeLine
highlight! link GitGutterDelete GitGutterDeleteLine
sign define QFS_VCS_CHANGE text=Δ texthl=gitcommitUnmergedFile
sign define QFS_VCS_ADD text=+ texthl=gitcommitSelectedFile
sign define QFS_VCS_DEL text=- texthl=gitcommitDiscardedFile

"Gundo
map <Leader>u :GundoToggle<CR>

" Fugitive
nmap <leader>gl :Glog<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gcm :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gch :Git dc<CR>

" Neomake
if has("nvim")
  let g:neomake_error_sign = {'texthl': 'DiffDelete'}
  let g:neomake_warning_sign = {'texthl': 'DiffChange'}
  let g:neomake_open_list = 2

  " Custom python makers
  let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']

  " Disable various filetypes
  let g:neomake_sh_enabled_makers = []
  let g:neomake_zsh_enabled_makers = []
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:LanguageClient_serverCommands = {
        \ 'go': ['go-langserver', '-gocodecompletion'],
        \ 'python': ['pyls'],
        \ }

  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endif

"CtrlP
let g:ctrlp_map = '<leader><space>'
let g:ctrlp_working_path_mode = 0
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>, :CtrlPMRU<cr>
nnoremap <leader>f :CtrlPBuffer<cr>

" FixWhitespace
nnoremap <leader>wh :FixWhitespace<cr>
vnoremap <leader>wh :FixWhitespace<cr>

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"NERDTree
nnoremap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0

"Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_foldlevel = 2
let g:tagbar_width = 30

"DetectIndent
nmap <silent> <leader>di :DetectIndent<CR>

" Indent guides
let g:indent_guides_color_change_percent = 3

"Gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1

"Configure EasyTag
"let g:easytags_auto_update = 0
"let g:easytags_autorecurse = 1
"let g:easytags_on_cursorhold = 0 "Turns auto everything off
"let g:easytags_dynamic_files = 1

" Netrw
nnoremap <silent> <F9> :Explore<CR>

"Configure language specifc options
"PHP
let php_htmlInStrings = 1
let php_sql_query = 1
let php_folding = 2
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_baselib = 1

"C
"let g:syntastic_c_compiler_options = ' -std=gnu99'
let c_space_errors = 1
"let c_syntax_for_h = 1

" TCL
let tcl_extended_syntax=1

"Python
" let g:python_host_prog = '/usr/local/bin/python2'
" let g:loaded_python_provider = 1  " disbale python 2
" let g:python3_host_prog = '/usr/local/bin/python'
let python_version_2 = 1
let python_highlight_all = 1

let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0

" Deoplete Jedi
let deoplete#sources#jedi#show_docstring = 1

"Ruby
let ruby_operators = 1
let ruby_space_errors = 1
" let ruby_no_expensive = 1

"Configure Eclim
let g:EclimSignLevel = 0
let g:EclimXmlValidate = 0
let g:EclimCValidate = 0
let g:EclimPythonValidate = 0
let g:EclimJavascriptValidate = 0

" Modify Status line
set laststatus=2

"Some mappin'
"Easily edit and source vim
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Expand %% to the directory of the current buffer in command mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"Easier window movement
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
nmap <silent> <BS> <C-w>h
let g:terminalkeys_loaded = 1

"Get rid of highlighting after search with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Forget sudo? Here ya go!
set pastetoggle=<F12>

" Retag with ctags
noremap <Leader>ct :!ctags -R *<CR><CR>

"
" Some Custom functions
"

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

function! AutoindentToggle(...)
  if &formatoptions =~ 'a'
    set formatoptions-=a
    echo "-- Auto Indent Off --"
  else
    set formatoptions+=a
    echo "-- Auto Indent On --"
  endif
endfunction
command! -bar -nargs=0 AutoindentToggle call AutoindentToggle()
nnoremap <silent> <leader>ai        :AutoindentToggle<CR>

nnoremap <silent> <leader>cd         :lcd %:p:h<CR>:pwd<CR>

set modeline
