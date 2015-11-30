" An example for a vimrc file.
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" indentation options
set expandtab
set autoindent		" always set autoindenting on
set tabstop=4	        " apropriate indentation
set shiftwidth=4	" apropriate indentation

" general
set hidden
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Placement of temp files
set backupdir=./.vimbackup,~/.vimbackup,.,/tmp

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" No bell at all
"set vb t_vb=

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Shortcuts

" Ctrl-H toggles search highlighting
map <C-h> :set hls!<CR>

" shift buffers
" map <C-p> :bprevious<CR>
" map <C-n> :bnext<CR>
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

imap <Up> <Esc>lk
imap <Down> <Esc>lj
imap <Right> <Esc>ll
imap <Left> <Esc>

" make with C-m
map <C-m> :make<CR>

" pathogen
call pathogen#infect()

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " numbering
  autocmd BufRead,BufNewFile *.asm     set number

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Fold
set foldmethod=marker

" Coloring options
" change anoying blue comment color
highlight Normal guibg=black guifg=darkgray
highlight Statement guifg=#BBBB20

" Python
" Pydiction
if has("autocmd")
"    autocmd FileType python set complete+=k"c:/documents and settings/stefan/my documents/vimfiles/pydiction" iskeyword+=.,(
"    autocmd! BufRead,BufNewFile *.py     set noexpandtab

    " Put every python file buffer in dos file format mode
    " autocmd FileType python set ff=dos
endif " has("autocmd")

" TEX - tex options now in .vim/ftplugin/tex.vim

" OpenCL
autocmd! BufRead,BufNewFile *.cl     setf opencl
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
set runtimepath+=/usr/share/vim/addons/
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" clojure
:helptags ~/.vim/bundle/VimClojure/doc/
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
" this should only be necessary if you don't have the ng client in your PATH
let vimclojure#NailgunClient = "/home/stefan/alien/vimclojure/client/ng"
let vimclojure#WantNailgun = 1

" autowrite
set autowrite

" Font
set guifont=Monospace\ 12
