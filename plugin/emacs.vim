
noremap! <C-f> <Right>
noremap! <C-b> <Left>

noremap! <C-A-f> <S-Right>
noremap! <C-A-b> <S-Left>

noremap! <C-a> <Home>
noremap! <C-e> <End>

noremap! <C-d> <Del>

noremap! <C-A-h> <C-w>
noremap! <C-A-d> <Cmd>normal de<CR>

noremap! <C-t> <Cmd>set virtualedit=onemore<CR><Cmd>exec 'normal >>' .. shiftwidth() .. 'l'<CR><Cmd>set virtualedit=<CR>
noremap! <C-A-t> <Cmd>set virtualedit=onemore<CR><Cmd>exec 'normal ' .. shiftwidth() .. 'h<<'<CR><Cmd>set virtualedit=<CR>

