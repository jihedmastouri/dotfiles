" Theme
syntax on

" Context
set colorcolumn=80
set nu
set rnu
set scrolloff=8
set signcolumn=yes
set nowrap
set noerrorbells
set novisualbell
set t_Co=256

" File Type
set encoding=utf8
set fileencoding=utf8

" Search
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Whitespace
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Splits
set splitright
set splitbelow

" Speedy Gonzales
set lazyredraw
set noswapfile

" Fold Functions
set foldmethod=expr

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif
" set timeout timeoutlen=1000 ttimeoutlen=100
