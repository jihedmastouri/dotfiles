let mapleader = " "

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P
vnoremap p "_dP
nnoremap yy ^y$
nnoremap Y y$    " Yank to line end
xnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy

" Normal x Visual Mode
xnoremap x "_d
xnoremap <tab> >gv
xnoremap <S-tab> <gv

" Insert Mode
inoremap jk <esc>

" Window Nagigation
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-s> <C-w>v
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>

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
nnoremap ZX :q!<CR>  " Close Vim without saving 
nnoremap ZB :w<bar>bw<CR>  " Save Buffer and close it
nnoremap Q gq " Badly align
nnoremap <leader>v :vert topleft sb#<CR> " split previous buffer to left

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf

" Insert Mode navigation
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
