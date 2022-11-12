
au FileType markdown setlocal wrap
au FileType markdown setlocal textwidth=79 "auto wrap
au FileType markdown setlocal spell
au FileType markdown setlocal tabstop=2
au FileType markdown setlocal shiftwidth=2
au FileType markdown setlocal softtabstop=2

au BufRead,BufNewFile *.tera setlocal filetype=html
au FileType html,css,javascript,json,htmldjango setlocal tabstop=2
au FileType html,css,javascript,json,htmldjango setlocal shiftwidth=2
au FileType html,css,javascript,json,htmldjango setlocal softtabstop=2

au FileType toml setlocal tabstop=2
au FileType toml setlocal shiftwidth=2
au FileType toml setlocal softtabstop=2

au FileType lua,kahlua setlocal tabstop=2
au FileType lua,kahlua setlocal shiftwidth=2
au FileType lua,kahlua setlocal softtabstop=2
au FileType lua,kahlua setlocal formatoptions=jcrqla

au FileType asm setlocal tabstop=8
au FileType asm setlocal shiftwidth=8
au FileType asm setlocal softtabstop=8
au FileType asm setlocal noexpandtab

au FileType python setlocal shiftwidth=4
au FileType python setlocal tabstop=4
au FileType python setlocal softtabstop=4
au FileType python setlocal expandtab
au FileType python setlocal formatoptions=acrqnp
au FileType python setlocal showmatch
au FileType python setlocal nofoldenable
au FileType python setlocal number
"au FileType python colorscheme python

au FileType pdf setlocal rulerformat=BYTE:\ %o

au FileType calendar setlocal noexpandtab

au FileType gitcommit setlocal spell
au FileType gitconfig setlocal noexpandtab

au FileType fish colorscheme fish
au FileType fish setlocal omnifunc=FishComplete
au FileType fish inoremap <S-TAB> <C-X><C-O>
au FileType fish inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
au FileType fish inoremap <expr> <TAB> pumvisible() ? "\<lt>Down>" : "<TAB>"
au FileType fish inoremap <expr> <BS> pumvisible() ? "<ESC>a" : "<BS>"

au FileType sh setlocal formatoptions=crqanj
au FileType sh setlocal formatlistpat=^\\s*\\([\\d]\\+[.)]\\\|[*-]\\)\\s*
