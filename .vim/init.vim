" Ryan McGowan's init.vim

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
let mapleader = ';'

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
  colorscheme tokyonight-moon
  " Indent guides
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1e2030
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2f334d

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
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,*.pyc,*node_modules*,*/venv/*,*/build/*,*/vendor/*
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

packadd cfilter

"
" Plugin Config

" Rainbow
let g:rainbow_active = 1
nmap <leader>n :RainbowToggle<CR>

" Deoplete

let g:deoplete#enable_at_startup = 0
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Instant Markdown
" Do not enable by default
let g:instant_markdown_autostart = 0

" Limelight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#languageclient#enabled = 1

" minibufexpl
"let g:miniBufExplVSplit = 25
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplUseSingleClick = 1

"Slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

"Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'

" Autornu
let g:autornu_enable = 0

"Vim clojure static
let g:clojure_align_multiline_strings = 0
" Set *.cljs files to the clojure filetype

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

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

nnoremap <leader>rr :silent lgrep!<space>
nnoremap <leader>rw :silent lgrep! -w <C-R><C-W><space>

" Open and close the location and quickfix list
nmap <leader>cc :cclose<CR>
nmap <leader>co :copen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>lo :lopen<CR>

" QFS or GitGutter
nnoremap <leader>gg :GitGutterToggle<CR>
let g:gitgutter_sign_modified = 'Δ'

nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterRevertHunk)

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
nmap <leader>gs :Git<CR>
nmap <leader>gcm :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gch :Git dc<CR>

" vimgo

" Prefer LanguageClient
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0

" Nvim

"FzFLua
nnoremap <leader><space> :FzfLua<cr>
nnoremap <leader><space><space> :FzfLua<cr>
nnoremap <leader><space>g :FzfLua live_grep_native<cr>
nnoremap <leader><space>t :FzfLua tags_grep_cword<cr>
nnoremap <leader><space>f :FzfLua files<cr>
nnoremap <leader><space>b :FzfLua buffers<cr>

"DetectIndent
nmap <silent> <leader>di :DetectIndent<CR>

"Gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1


"Configure language specifc options
"PHP
let php_htmlInStrings = 1
let php_sql_query = 1
let php_folding = 2
let php_parent_error_close = 1
let php_parent_error_open = 1

"C
let c_space_errors = 1

" TCL
let tcl_extended_syntax=1

"Python
let g:python_host_prog = expand('~/.pyenv/shims/python')
let g:python3_host_prog = expand('~/.pyenv/shims/python')

" Vim settings
" let python_version_2 = 1
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
nnoremap <silent> <leader>el :e $HOME/.vim/lua/setup.lua<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Expand %% to the directory of the current buffer in command mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"Easier window movement
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
let g:terminalkeys_loaded = 1

"Get rid of highlighting after search with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Retag with ctags
noremap <Leader>ct :call jobstart('git ctags-files')<CR><CR>
" Copy path to clipboard
noremap <Leader>pb :silent !echo '%' <Bar> pbcopy<CR><CR>

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

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1
set nofoldenable
set exrc

lua require("lsp")
lua require("setup")

" Trouble setup
nnoremap <leader>xx <cmd>Trouble toggle<cr>

" Close all buffers
nnoremap <leader>cb :%bd <bar> e# <bar> bd# <CR>
