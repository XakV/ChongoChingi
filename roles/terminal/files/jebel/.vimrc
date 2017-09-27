" Plugin Configuration
" Plugin Directory and Plugins to load
call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/vimwiki/vimwiki.git', { 'branch': 'dev' }
Plug 'https://github.com/preocanin/greenwint.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

call plug#end()

" Native Vim configuration

" Vim Keys configuration
" leader
let mapleader = ';'

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

" vim 256 color
if !has('gui_running')
  set t_Co=256
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
let g:netrw_winsize = -28

" netrw view - tree view
let g:netrw_liststyle = 3

" netrw split right
let g:netrw_altv=1

" netrw sort
let g:netrw_sort_sequence = '[\/]$,*'

" netrw open file behaviour
let g:netrw_browse_split = 1

" Tcomment config - ',cc will comment or uncomment a line'
noremap <silent> <Leader>cc :TComment<CR>

" Lightline config
let g:lightline = { 'colorscheme': 'one', }
set laststatus=2
set noshowmode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

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
let g:vimwiki_list = [{'syntax': 'markdown', 'path': '~/Documents/VimWiki/', 'ext': '.md', 'nested_syntaxes': {'python':'python', 'bash':'bash', 'lua':'lua'}, 'auto_toc': '1', 'index': 'index', 'folding': 'expr'}]
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
" set background=dark
colorscheme greenwint
