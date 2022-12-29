let mapleader = " "

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P
vnoremap P "_dP
nnoremap yy ^y$
nnoremap Y y$    " Yank to line end
xnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy

" Normal x Visual Mode
xnoremap x "_d
xnoremap <tab> >gv
xnoremap <S-tab> <gv

" Window Nagigation
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
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
nnoremap <c-d> <c-d>zz
nnoremap <c-b> <c-b>zz

" Miscellaneous
nnoremap <S-u> <Nop> " Disable U
nnoremap Q gq " Badly align
nnoremap ZX :q!<CR>  " Close Vim without saving 
nnoremap ZB :w<bar>bw<CR>  " Save Buffer and close it
inoremap jk <Esc>


" Disable Arrow Keys
nmap <up> :echo "noooooooooooo!"<CR>
nmap <down> :echo "noooooooooooo!"<CR>
nmap <left> :echo "noooooooooooo!"<CR>
nmap <right> :echo "noooooooooooo!"<CR>

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
