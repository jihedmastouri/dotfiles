set jumpoptions=stack

nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>zz
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>zz

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap \! \!<C-g>u
inoremap ? ?<C-g>u
inoremap \n \n<C-g>u
