"The necessities

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Make vundel manage vundle
Bundle 'git://github.com/gmarik/vundle'

"Git bundles
Bundle 'git://github.com/vim-scripts/The-NERD-tree'
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter'
"Bundle 'git://github.com/vim-scripts/YankRing.vim'
Bundle 'git://github.com/vim-scripts/JavaImp.vim--Lee'

Bundle 'git://github.com/tpope/vim-fugitive'
"Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'git://github.com/msanders/snipmate.vim'
"Bundle 'git://github.com/slack/vim-bufexplorer'
"Bundle 'git://github.com/fholgado/minibufexpl.vim'
Bundle 'git://github.com/VictorDenisov/javacomplete'
Bundle 'git://github.com/wincent/Command-T'
Bundle 'git://github.com/ciaranm/detectindent.git'
"Bundle 'git://github.com/jonyamo/dbext.vim.git'
Bundle 'git://github.com/plasticboy/vim-markdown.git'
Bundle 'git://github.com/xolox/vim-easytags.git'
"Bundle 'git://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git'
Bundle 'git://github.com/vim-scripts/taglist.vim.git'


"Vim Script bundles
Bundle 'project.tar.gz'

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set backupdir=~/.vimbackups

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

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

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number

"MY CUSTOM TABING
set wrap
set linebreak

"Some fun stuff which makes life easier
set number
set hidden
set history=1000
set undolevels=1000
set scrolloff=6
let loaded_matchparen = 1 "Slows moving around down if on
"set showmatch 

"Foldiness
set foldenable
"set foldlevel=20
"set foldmethod=syntax

"Tagbar Fun
nnoremap <silent> <F7> :NERDTreeToggle<CR>
"nmap <silent> <leader>tb :TagbarToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nmap <silent> <leader>di :DetectIndent<CR>

"Easier tabbing
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
"Easier window movement
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
"Only works with minibufexplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapCTabSwitchBufs = 1

"Configure EasyTag
"let g:easytags_auto_update = 0
"let g:easytags_autorecurse = 1
let g:easytags_on_cursorhold = 0 "Turns auto everything off
let g:easytags_dynamic_files = 1

"Configure Tlist
let Tlist_Use_Right_Window = 1
let Tlist_Max_Submenu_Items = 18
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Highlight_Tag = 0
let Tlist_WinWidth = 22

"Configure language specifc options
"PHP
let php_htmlInStrings = 1
let php_folding = 2
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_baselib = 1

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"Some mappin'
"Easily edit and source vim
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"I just wanted this to be easier
nnoremap <silent> <leader>] $
nnoremap <silent> <leader>[ 0

"Get rid of highlighting after search with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"Forget sudo? Here ya go!
cmap w!! w !sudo tee % >/dev/null
set pastetoggle=<F12>


"Set our colorscheme
colorscheme elflord

"Change the way numbers look
highlight LineNr term=NONE ctermfg=grey

"latexsuite plugin told me to add this
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"
" Some Custom functions
"

"Show and Trim Spaced Function
function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function! TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <silent> <leader>ss     :ShowSpaces 1<CR>
nnoremap <silent> <leader>ts  m`:TrimSpaces<CR>``
vnoremap <silent> <leader>ts   :TrimSpaces<CR>
