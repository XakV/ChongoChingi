" Basic Stuff
set nocompatible
syntax on 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Configuration
" Plugin Directory and Plugins to load
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'diepm/vim-rest-console'
Plug 'https://github.com/vimwiki/vimwiki.git', { 'branch': 'dev' }
Plug 'https://github.com/preocanin/greenwint.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/fcpg/vim-farout.git'
Plug 'https://github.com/fcpg/vim-orbital.git'
Plug 'https://github.com/lifepillar/vim-colortemplate'
Plug 'https://github.com/WolfgangMehner/lua-support.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/liuchengxu/space-vim-dark'
Plug 'https://github.com/yuttie/inkstained-vim.git'
Plug 'https://github.com/ajmwagar/vim-deus.git'
Plug 'https://github.com/hauleth/blame.vim.git'
Plug 'ajh17/spacegray.vim'

call plug#end()

" Native Vim configuration

" Vim Keys configuration
" leader - I commented this out to see if it was part of the problem where I
" got junk when opening vim
" let mapleader = ';'

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
  " autocmd VimEnter * :Vex

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Netrw config
" width of netrw window
let g:netrw_winsize = 28

" netrw view - tree view
let g:netrw_liststyle = 3

" netrw split right
let g:netrw_altv=1

" netrw sort
let g:netrw_sort_sequence = '[\/]$,*'

" netrw open file behaviour
let g:netrw_browse_split = 1

" LuaSupport Config
let g:Lua_MapLeader = '['


" Tcomment config - ',cc will comment or uncomment a line'
noremap <silent> <Leader>cc :TComment<CR>

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

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%{FugitiveStatusline()}
"set statusline+=%*

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tabular config
vnoremap <silent> <Leader>cee    :Tabularize /=<CR> ",cee - align tabs on '='
vnoremap <silent> <Leader>cet    :Tabularize /#<CR> ",cet - align tabs on '#'
vnoremap <silent> <Leader>cep    :Tabularize /\|<CR> ",cep - align tabs on '|'

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
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_list = [{'syntax': 'markdown', 'path': '~/Documents/Wikkit/', 'ext': '.md', 'nested_syntaxes': {'python':'python', 'bash':'bash', 'lua':'lua'}, 'auto_toc': '1', 'index': 'index', 'folding': 'expr'}]

" Vimwiki remap open links in split
nmap <leader>we <Plug>vimwikiSplitLink
nmap <leader>wv <Plug>VimwikiVSplitLink

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
