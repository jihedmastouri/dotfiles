nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>zz
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>zz

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <CR> <CR><C-g>u

" imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

let g:neoformat_try_node_exe = 1


" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
