
au FileType text call pencil#init({'wrap': 'hard', 'joinspaces': 1, 'cursorwrap': 0, 'autoformat': 1})
au FileType text setlocal shiftwidth=8
au FileType text setlocal tabstop=8
au FileType text setlocal softtabstop=8
au FileType text setlocal noexpandtab
au FileType text setlocal textwidth=80
au FileType text setlocal wrap
au FileType text setlocal sidescroll=8
au FileType text setlocal spell
au FileType text setlocal formatoptions-=1
au FileType text setlocal formatoptions+=p
"au FileType text setlocal formatlistpat=^(\\d\\+[.)]\\t\\\|\\s*[-*+]\\s\\+)
au FileType text colorscheme text

au FileType markdown setlocal nofoldenable
au FileType markdown setlocal conceallevel=2
au FileType markdown setlocal textwidth=79 "auto wrap
au FileType markdown setlocal wrap
au FileType markdown setlocal spell
au FileType markdown call pencil#init({'wrap': 'soft', 'joinspaces': 1, 'cursorwrap': 0, 'autoformat': 1})
"au FileType markdown colorscheme markdown

au FileType html,htmldjango setlocal tabstop=2
au FileType html,htmldjango setlocal shiftwidth=2
au FileType html,htmldjango setlocal softtabstop=2
au FileType css setlocal tabstop=2
au FileType css setlocal shiftwidth=2
au FileType css setlocal softtabstop=2
au FileType javascript setlocal tabstop=2
au FileType javascript setlocal shiftwidth=2
au FileType javascript setlocal softtabstop=2
au FileType json setlocal tabstop=2
au FileType json setlocal shiftwidth=2
au FileType json setlocal softtabstop=2
au FileType json setlocal conceallevel=0

au FileType toml setlocal tabstop=2
au FileType toml setlocal shiftwidth=2
au FileType toml setlocal softtabstop=2

au FileType rust setlocal formatoptions-=o
au FileType rust setlocal textwidth=79

au FileType lua setlocal tabstop=2
au FileType lua setlocal shiftwidth=2
au FileType lua setlocal softtabstop=2
au FileType lua setlocal formatoptions=jcrqla

au FileType asm setlocal tabstop=8
au FileType asm setlocal shiftwidth=8
au FileType asm setlocal softtabstop=8
au FileType asm setlocal noexpandtab

au FileType python setlocal shiftwidth=4
au FileType python setlocal tabstop=4
au FileType python setlocal softtabstop=4
au FileType python setlocal expandtab
au FileType python setlocal formatoptions+=r
au FileType python setlocal showmatch
au FileType python setlocal nofoldenable
au FileType python colorscheme python

au FileType pdf setlocal rulerformat=BYTE:\ %o

au FileType calendar setlocal noexpandtab

au FileType gitcommit setlocal spell

au FileType fish colorscheme fish

au FileType sh setlocal formatoptions=crqanj
au FileType sh setlocal formatlistpat=^\\s*\\([\\d]\\+[.)]\\\|[*-]\\)\\s*
