if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Theme
syntax on
" set t_Co=256
set termguicolors

let mapleader = " "

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

" Paste AND Yank
noremap <leader>p "0p
noremap <leader>P "0P
vnoremap P "_dp
nnoremap yy ^y$
nnoremap YY vapy
nnoremap Y y$ " Yank to line end
xnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>yy "+yy
nnoremap <leader>YY vap"+y

" Normal x Visual Mode
xnoremap x "_d
xnoremap <tab> >gv
xnoremap <S-tab> <gv

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
inoremap jk <Esc>

" Folds
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf

" jump history
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>zz
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>zz

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <CR> <CR><C-g>u

if $DARK_THEME==1
	colorscheme desert
else
	colorscheme morning
endif

