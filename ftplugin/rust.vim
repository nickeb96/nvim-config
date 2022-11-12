if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal matchpairs+=<:>

setlocal textwidth=119
setlocal formatoptions=cnpljqr
setlocal cpoptions+=J
setlocal joinspaces
setlocal spellcapcheck=[.?!]\ \\{2}
setlocal nowrap

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
"lua require'lspconfig'.rust_analyzer.setup({})

setlocal spell
