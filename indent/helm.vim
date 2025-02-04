" Vim indent file
" Language:	Helm Chart templates
" Maintainer:	no one
" Last Change:	Jan 12 2025

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

" Use YAML formatting rules.
runtime! indent/yaml.vim
