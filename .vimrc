" Ryan McGowan's .vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Make sure filetype is off for vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

let g:vundle_default_git_proto = 'git'


"Make vundle manage vundle
Bundle 'gmarik/vundle'

"My bundles
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'majutsushi/tagbar'
Bundle 'ciaranm/detectindent'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/gist-vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'

"Testing
Bundle 'chrismetcalf/vim-yankring'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'mileszs/ack.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-rsi'
Bundle 'RyanMcG/vim-guifontzoom'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-dispatch'
Bundle 'airblade/vim-gitgutter'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-function'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-underscore'
Bundle 'kana/vim-textobj-syntax'
Bundle 'RyanMcG/vim-textobj-dash'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'bps/vim-textobj-python'

" Colorschemes
"Bundle 'noahfrederick/Hemisu'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'jeffreyiacono/vim-colors-wombat'
Bundle 'vim-scripts/xoria256.vim'

"Languge specific

" TCL
Bundle 'tcl.vim'

"Java
"Bundle 'VictorDenisov/javacomplete'
"Bundle 'vim-scripts/JavaImp.vim--Lee'

" Scala
Bundle 'derekwyatt/vim-scala'
Bundle 'derekwyatt/vim-sbt'

"Latex
"Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'

"Clojure
Bundle 'paredit.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
"Bundle 'slimv.vim'
Bundle 'jpalardy/vim-slime'
Bundle 'dgrnbrg/vim-redl'

"Markdown
Bundle 'tpope/vim-markdown'
"Bundle 'hallison/vim-markdown'
Bundle 'tangledhelix/vim-octopress'

" Dot
Bundle 'wannesm/wmgraphviz.vim'

"Python
Bundle 'ivanov/vim-ipython'
Bundle 'vim-scripts/python.vim--Vasiliev.git'
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'

" YAML
Bundle 'avakhov/vim-yaml'

"HTML/CSS
Bundle 'mattn/zencoding-vim'
Bundle 'othree/html5.vim'

" Less
Bundle 'groenewege/vim-less'

"Javascript
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'felixge/vim-nodejs-errorformat'
Bundle 'godlygeek/tabular'
Bundle 'wavded/vim-stylus'

"Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
"Bundle 'astashov/vim-ruby-debugger'
Bundle 'tpope/vim-endwise'
Bundle 'danchoi/ri.vim'

"Removed
"Bundle 'ervandew/supertab'
"Bundle 'Raimondi/delimitMate'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'vim-scripts/AutoComplPop'
"Bundle 'jonyamo/dbext.vim'
"Bundle 'sjl/splice.vim'
"Bundle 'benmills/vimux'
"Bundle 'tomtom/quickfixsigns_vim'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'vim-scripts/ZoomWin'

"Make sure my after is really at the end.
set runtimepath-=~/.vim
set runtimepath-=~/.vim/bundle/eclim
set runtimepath-=~/.vim/after/
set runtimepath^=~/.vim
set runtimepath+=~/.vim/bundle/eclim
set runtimepath+=~/.vim/after

"Source matchit.vim (included in vim 7)
runtime macros/matchit.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set backupdir=~/.vim/backups

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

"Set our colorscheme
if has("gui_running")
  colorscheme solarized
  set cc=80
  let g:Powerline_symbols = 'fancy'
  let g:Powerline_colorscheme = 'solarized256'
  highlight clear SignColumn
  set noballooneval
  highlight Visual gui=NONE guifg=NONE guibg=#084250
elseif &t_Co >= 256
  colorscheme xoria256
else
  colorscheme elflord
endif

"Change the way numbers look
"nmap <silent> <leader>hl :highlight LineNr term=NONE ctermfg=grey ctermbg=black<CR>
"highlight LineNr term=NONE ctermfg=grey ctermbg=black
highlight WarningMsg term=bold cterm=bold ctermbg=239 ctermfg=yellow guifg=yellow guifg=#4e4e4e

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
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
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
set scrolloff=6 sidescrolloff=12
"Ignore case unless there's a capital
set ignorecase
set smartcase
"Split below and to the right instead of default
"set splitbelow "Makes MiniBufExplorer appear at the bottom
"set splitright
set title
"let loaded_matchparen = 0 "Uncomment to turn off
set showmatch

"Completeion in command mode
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set wildmode=list:longest,full

"Foldiness
set foldenable
set foldlevel=99 " Basically don't fold stuff
set foldmethod=syntax

" Set omnifunc to syntax completion
set omnifunc=syntaxcomplete@Complete

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Add charater to front of wrapped lines
set showbreak=↪

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"
" Plugin Config
"

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

"Vim clojure static
let g:clojure_align_multiline_strings = 0
" Set *.cljs files to the clojure filetype

autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

let mapleader = '\'
" Paredit
let g:paredit_shortmaps = 1

" Fireplace (Clojure)
set viminfo+=! "Not actually a fireplace option, but presists cached cp

"Slime
let g:slime_target = "tmux"

"Snipmate
inoremap <C-space> <Plug>snipMateNextOrTrigger
snoremap <C-space> <Plug>snipMateNextOrTrigger

"Ack
nmap <leader>a/ :Ack!<space>
nmap <leader>a* :Ack! -w <C-R><C-W><space>
nmap <leader>aa :AckAdd<space>

" Open and close the location and quickfix list
nmap <leader>qc :cclose<CR>
nmap <leader>qo :copen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>lo :lopen<CR>

" Next in ccl
nmap ]e :cnext<CR>
nmap [e :cprev<CR>

" Next Tab
nmap ]t :tabnext<CR>
nmap [t :tabprev<CR>

" Next Tab
nmap ]b :bnext<CR>
nmap [b :bprevious<CR>

"Tabularize
if exists('g:tabular_loaded')
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /^[^>]*\zs=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      / = /l0
  AddTabularPattern! comma           /^[^,]*,/l1
  AddTabularPattern! colon           /:\zs /l0
  AddTabularPattern! options_hashes  /:\w\+ =>/
endif
map <Leader>b :Tabularize<space>

" QFS or GitGutter
nnoremap <leader>gg :GitGutterToggle<CR>
let g:gitgutter_sign_modified = 'Δ'
let g:gitgutter_sign_modified_removed = 'Δ_'
"let g:gitgutter_diff_args = '-w'
highlight link GitGutterAdd GitGutterAddLine
highlight link GitGutterChange GitGutterChangeLine
highlight link GitGutterChangeDelete GitGutterChangeLine
highlight link GitGutterDelete GitGutterDeleteLine
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

"CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>, :CtrlPMRU<cr>
nnoremap <leader>f :CtrlPBuffer<cr>
nnoremap <leader>x :CtrlPMixed<cr>

" FixWhitespace
nnoremap <leader>wh :FixWhitespace<cr>

" Supertab
set completeopt-=preview
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"NERDTree
nnoremap <silent> <F7> :NERDTreeToggle<CR>

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
let python_highlight_all = 1
" turn off pymode's lint and rope
let g:pymode_lint = 0 " Use syntastic
let g:pymode_rope = 0 " Use jedi
let g:pymode_doc = 0 " Use jedi
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:pymode_lint_checker = "pep8"
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()  # XXX BREAKPOINT"
"let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'local'

"Ruby
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_fold = 1
let ruby_no_comment_fold = 1

"Configure Eclim
let g:EclimSignLevel = 0
let g:EclimXmlValidate = 0
let g:EclimCValidate = 0
let g:EclimPythonValidate = 0
let g:EclimJavascriptValidate = 0

" Modify Status line
set laststatus=2
set statusline=%<%f\ %h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=%=%-14.(%l,%c%V%)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %P

"Some mappin'
"Easily edit and source vim
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Expand %% to the directory of the current buffer in command mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"Easier window movement
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h

"Get rid of highlighting after search with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Forget sudo? Here ya go!
cmap w!! w !sudo tee % >/dev/null
set pastetoggle=<F12>

" Retag with ctags
map <Leader>ct :!ctags *<CR><CR>

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
nnoremap <silent> <leader>ai	:AutoindentToggle<CR>

nnoremap <silent> <leader>cd 	:lcd %:p:h<CR>:pwd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
  " Copy the variable under the cursor into the 'a' register
  :let l:tmp_a = @a
  :normal "ayiw
  " Delete variable and equals sign
  :normal 2daW
  " Delete the expression into the 'b' register
  :let l:tmp_b = @b
  :normal "bd$
  " Delete the remnants of the line
  :normal dd
  " Go to the end of the previous line so we can start our search for the
  " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
  " work; I'm not sure why.
  normal k$
  " Find the next occurence of the variable
  exec '/\<' . @a . '\>'
  " Replace that occurence with the text we yanked
  exec ':.s/\<' . @a . '\>/' . @b
  :let @a = l:tmp_a
  :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<cr>
