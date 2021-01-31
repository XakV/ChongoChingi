" Basic Stuff
set nocompatible
syntax on 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Plugin Configuration
" Plugin Directory and Plugins to load
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'wdhg/dragon-energy'
Plug 'tpope/vim-fugitive'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'https://github.com/glench/vim-jinja2-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'https://github.com/vimwiki/vimwiki.git', { 'branch': 'dev' }
Plug 'dense-analysis/ale'
Plug 'https://github.com/fcpg/vim-farout.git'
Plug 'https://github.com/fcpg/vim-orbital.git'
Plug 'https://github.com/liuchengxu/space-vim-dark'
Plug 'https://github.com/yuttie/inkstained-vim.git'
Plug 'https://github.com/ajmwagar/vim-deus.git'
Plug 'ajh17/spacegray.vim'

call plug#end()

" Native Vim configuration

" Vim Keys configuration
" Backslash is Leader
let mapleader = '\'

" run Black as <leader> + B
nnoremap <Leader>B :Black<CR>

" Reload config ',v will reload config'
map <Leader>9 :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>

" Autowrite - save when switching buffer
set autowrite

" Searching and lowercase
set smartcase
set ignorecase

" vim backup and swap files go to
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

" vim line numbering
set number
set relativenumber

" vim backspace in insert mode
set backspace=indent,eol,start

" vim mouse
set mouse=a

" vim true color
if !has('gui_running')
  set termguicolors
  set t_Co=truecolor
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
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Always start with netrw
  autocmd VimEnter * :Vex

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Netrw config
" width of netrw window
let g:netrw_winsize = 30

" netrw view - tree view
let g:netrw_liststyle = 3

" netrw split right
let g:netrw_altv=1

" netrw sort
let g:netrw_sort_sequence = '[\/]$,*'

" netrw open file behaviour
let g:netrw_browse_split = 1

" ALE config
" Auto fix files on save
let g:ale_fix_on_save = 1

" ALE auto-completion
let g:ale_completion_enabled = 1

" ALE auto-complete from other modules
let g:ale_completion_autoimport = 1

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {'gitbranch': 'fugitive#head'},
      \ }

" VimWiki config
let wiki_1 = {}
let wiki_1.path = '~/Documents/Markdown/Wikkit/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.nested_syntaxes = {'python':'python', 'bash':'bash', 'lua':'lua'}

let wiki_2 = {}
let wiki_2.path = '~/Documents/Markdown/NixWix/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.nested_syntaxes = {'python':'python', 'bash':'bash', 'lua':'lua'}

let g:vimwiki_list = [wiki_1, wiki_2]

" and use leader to move through splits
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>k :wincmd k<CR>

" use leader to resize
nmap <leader>+ :resize +20<CR>
nmap <leader>_ :resize -20<CR>
nmap <leader>= :vertical resize +20<CR>
nmap <leader>- :vertical resize -20<CR>


" Colorscheme config
set background=dark
colorscheme spacegray
let g:spacegray_underline_search = 1

" other useful keybinds
" clear search highlights with leader -> esc
nnoremap <leader><esc> :noh<return><esc>
