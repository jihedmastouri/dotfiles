" Theme
syntax on
set t_Co=256
set termguicolors
set background=dark

" Context
set nu
set rnu
set cursorline
set colorcolumn=80
set scrolloff=8
set signcolumn=auto
set nowrap
set noerrorbells
set novisualbell
set mouse=a

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

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
