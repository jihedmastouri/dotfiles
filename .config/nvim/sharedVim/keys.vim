let mapleader = " "

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P

vnoremap P "_dp

nnoremap yy ^y$
nnoremap YY vapy
nnoremap Y y$    " Yank to line end

xnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy
nnoremap <leader>YY vap"+y

" Normal x Visual Mode
xnoremap x "_d
xnoremap <tab> >gv
xnoremap <S-tab> <gv

" Window Nagigation
noremap <silent> <C-S>> :vertical resize +1<CR>
noremap <silent> <C-S>< :vertical resize -1<CR>
nnoremap <leader>o <C-w>o
nnoremap <leader>v :vert topleft sb#<CR> <C-w>l" split previous buffer to left

" Alt Move
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap { {zz
nnoremap } }zz
nnoremap gg ggzz
nnoremap G Gzz
nnoremap <c-d> <c-d>zz
nnoremap <c-b> <c-b>zz

" Miscellaneous
nnoremap <S-u> <Nop> " Disable U
nnoremap q: <Nop> " Disable miss clicks
nnoremap Q gq " Badly align
nnoremap ZX :q!<CR>  " Close Vim without saving
nnoremap ZB :w<bar>bw<CR>  " Save Buffer and close it
inoremap jk <Esc>

" Disable Arrow Keys
nmap <up> <Nop>
nmap <down> <Nop>
nmap <left> <Nop>
nmap <right> <Nop>

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
