
au BufRead,BufNewFile *.tera setlocal filetype=html
au FileType html,css,javascript,json,htmldjango setlocal tabstop=2
au FileType html setlocal iskeyword+=-
au FileType html setlocal formatprg=tidy\ -iq\ -f\ /dev/null

au FileType toml setlocal tabstop=2

au FileType lua,kahlua setlocal tabstop=2
au FileType lua,kahlua setlocal formatoptions=jcrql

au FileType asm setlocal tabstop=8
au FileType asm setlocal noexpandtab
au FileType asm setlocal commentstring=//%s
au FileType asm setlocal comments=s1:/*,mb:*,ex:*/,://
au FileType asm setlocal filetype=arm

au FileType sql setlocal spell
au FileType sql setlocal commentstring=--%s

au FileType gitcommit setlocal spell
au FileType gitconfig setlocal noexpandtab

