
au BufRead,BufNewFile *.tera setlocal filetype=html
au FileType html,css,javascript,json,htmldjango setlocal tabstop=2
au FileType html,css,javascript,json,htmldjango setlocal shiftwidth=2
au FileType html,css,javascript,json,htmldjango setlocal softtabstop=2
au FileType html setlocal iskeyword+=-
au FileType html setlocal formatprg=tidy\ -iq\ -f\ /dev/null

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
au FileType asm setlocal commentstring=//%s
au FileType asm setlocal comments=s1:/*,mb:*,ex:*/,://
au FileType asm setlocal filetype=arm

au FileType sql setlocal spell
au FileType sql setlocal commentstring=--%s

au FileType calendar setlocal noexpandtab

au FileType gitcommit setlocal spell
au FileType gitconfig setlocal noexpandtab

au FileType fish setlocal omnifunc=FishComplete
au FileType fish inoremap <S-TAB> <C-X><C-O>
au FileType fish inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
au FileType fish inoremap <expr> <TAB> pumvisible() ? "\<lt>Down>" : "<TAB>"
au FileType fish inoremap <expr> <BS> pumvisible() ? "<ESC>a" : "<BS>"

au FileType sh setlocal formatoptions=crqanj
au FileType sh setlocal formatlistpat=^\\s*\\([\\d]\\+[.)]\\\|[*-]\\)\\s*

