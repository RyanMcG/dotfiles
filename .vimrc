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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" MY STUFF
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
set wrap
set linebreak

"Some fun stuff which makes life easier
set showmatch
set number
set hidden
set history=1000
set undolevels=1000

"Foldiness
set foldenable
set foldmethod=syntax
set foldlevel=20


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

  ""javacomplete.vim fun
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
  autocmd Filetype java setlocal textwidth=80
  autocmd Filetype javascript setlocal softtabstop=2
  autocmd Filetype javascript setlocal shiftwidth=2

  ""JavaImp.vim fun
  let g:JavaImpPathSep = ':'
  let g:JavaImpPaths = $HOME."/cur/rent/CSE\ 560/project/lab1/src/:".$HOME."/.vim/JavaImp/jmplst/"
  let g:JavaImpDataDir = $HOME."/.vim/JavaImp" 
  let g:JavaImpSortPkgSep = 0


inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 


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

"Some mappin'
"Easily edit and source vim
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
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
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Make Tag list appear on the right side
let Tlist_Use_Right_Window = 1
