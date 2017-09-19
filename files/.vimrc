" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Nov 05
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

if &term =~ "rxvt-unicode-256color"
  if has("terminfo")
    set t_Co=256
  endif
endif

if &term =~ "xterm-termite"
  if has("terminfo")
    set t_Co=256
  endif
endif


if &term =~ "xterm-256color"
  if has("terminfo")
    set t_Co=256
  endif
endif

" Show line number and relative line numbers
set number
set relativenumber

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

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

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"
" " Using git URL
" Plugins that are useful
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/davidhalter/jedi-vim.git'
" Plug 'https://github.com/valloric/youcompleteme.git'
Plug 'https://github.com/coxjc/VimSearch.git'
Plug 'https://github.com/eiginn/netrw.git'
" Plugins for colors
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/ipsod/nes.vim.git'
Plug 'https://github.com/kocakosm/hilal.git' 
Plug 'https://github.com/rakr/vim-two-firewatch'
Plug 'https://github.com/ikaros/smpl-vim'
Plug 'https://github.com/atelierbram/vim-colors_atelier-schemes.git'
Plug 'https://github.com/romainl/Apprentice.git'
Plug 'https://github.com/Canop/patine.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'

"  Plugins for vimwiki and taskwiki
Plug 'https://github.com/vimwiki/vimwiki.git', { 'branch': 'dev' }




call plug#end()

" This gets rid of all those yucky ~ files "
" Requires a .backup directory to be created"

" NO MORE RUDDY swap and tmp files"
set noswapfile
set nobackup
set nowritebackup

" Tabsmartlikeforpython?
set tabstop=4


" netrw splits
let g:netrw_winsize = 30
let g:netrw_altv = 1
let g:netrw_browse_split = 2


" Line Numbers and Colors

set nu
set background=dark
colorscheme nord

" Vimwiki Setup

let g:vimwiki_list = [{'syntax': 'markdown', 'path': '~/Documents/VimWiki/', 'ext': '.md', 'nested_syntaxes': {'python':'python', 'bash':'bash', 'ruby':'ruby'}, 'auto_toc': '1', 'index': 'index', 'folding': 'expr'}]
" Leader of the pack Leader Leader yah
let mapleader = "\<Space>"
" and use leader to move through splits
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>k :wincmd k<CR>

"useful in vimwiki leader+ww = open default wiki index
"                  leader+wt = open def wiki index in new tab
"Other ideas can be found at; https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/


" Split Defaults
let g:splitright = 1
let g:splitbelow = 1








