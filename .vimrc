syntax on
set nu
set rnu
set nohlsearch
set tabstop=4
set shiftwidth=4
set scrolloff=8
set nowrap
set smartcase
set ignorecase
set signcolumn=yes
set colorcolumn=100

let mapleader = "\<Space>"
noremap <leader>p \"0p
noremap <leader>P \"0P
map <leader>a ggVG

nnoremap e viw
nnoremap E viW
map Q gq " Don't use Ex mode, use Q for formatting.

xnoremap <tab> >gv
xnoremap x \"_x
xnoremap <S-tab> <gv

inoremap jk <esc>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
