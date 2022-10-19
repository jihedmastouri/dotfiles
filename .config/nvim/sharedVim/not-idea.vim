set jumpoptions=stack

nnoremap } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

" Insert Mode Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap \! \!<C-g>u
inoremap ? ?<C-g>u
inoremap \n \n<C-g>u
