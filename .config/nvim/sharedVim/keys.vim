let mapleader = "\<Space>"

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P
vnoremap p "_dP
nnoremap yy ^y$
nnoremap Y y$    " Yank to line end
xnoremap <leader>y "+p

" Normal x Visual Mode
xnoremap x "_d
xnoremap <tab> >gv
xnoremap <S-tab> <gv

" Insert Mode
inoremap jk <esc>

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap \! \!<C-g>u
inoremap ? ?<C-g>u
inoremap \n \n<C-g>u

" Moving Fast! (with alt)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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
nnoremap Q gggqG " Badly align all document
nnoremap <leader>v :vert topleft sb#<CR> " split previous buffer to left

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
