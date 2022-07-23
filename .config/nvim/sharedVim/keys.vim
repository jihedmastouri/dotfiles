let mapleader = "\<Space>"

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P
vnoremap p "_dP
nnoremap yy ^y$
nnoremap gp o<Esc>p
nnoremap gP O<Esc>p

" NormalxVirtual Mode
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
nnoremap <silent> <up> <C-w>k
nnoremap <silent> <down> <C-w>j
nnoremap <silent> <left> <C-w>h
nnoremap <silent> <right> <C-w>l
nnoremap <silent> <C-s> <C-w>v

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap { {zz
nnoremap } }zz
nnoremap <c-d> <c-d>zz
nnoremap <c-b> <c-b>zz

" Miscellaneous
nnoremap <S-u> <Nop>" Disable U
nnoremap <S-y> y$   " Yank to line end
nnoremap ZX :q!<CR> " Close Vim without saving 

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
