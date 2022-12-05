
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>zz
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>zz

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! \!<C-g>u
inoremap ? ?<C-g>u
inoremap <CR> <CR><C-g>u
