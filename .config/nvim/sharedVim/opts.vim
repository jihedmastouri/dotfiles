" Theme
syntax on
" set t_Co=256
set termguicolors

" Context
set nu
set rnu
set cursorline
set cursorcolumn
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
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
" set lazyredraw

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif
