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
Bundle 'git://github.com/vim-scripts/YankRing.vim'
Bundle 'git://github.com/vim-scripts/JavaImp.vim--Lee'
Bundle 'git://github.com/vim-scripts/cake.vim'

Bundle 'git://github.com/tpope/vim-fugitive'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'git://github.com/msanders/snipmate.vim'
Bundle 'git://github.com/slack/vim-bufexplorer'
"Bundle 'git://github.com/fholgado/minibufexpl.vim'
Bundle 'git://github.com/VictorDenisov/javacomplete'
Bundle 'git://github.com/wincent/Command-T'
Bundle 'git://github.com/ciaranm/detectindent.git'


"Vim Script bundles
Bundle 'project.tar.gz'
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number

"MY CUSTOM TABING
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

"Tagbar Fun
nmap <silent> <F9> :TagbarOpenAutoClose<CR>
nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>tb :TagbarToggle<CR>
nmap <silent> <leader>di :DetectIndent<CR>

"Easier tabbing
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
"Only works with minibufexplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapCTabSwitchBufs = 1

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
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Make Tag list appear on the right side
let Tlist_Use_Right_Window = 1
