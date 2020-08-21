
""" setup for markdown composer plugin
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release --locked
  endif
endfunction


call plug#begin('~/.local/share/nvim/site/plugs')
source ~/.config/nvim/plugs.vim
call plug#end()


" use true colors instead of default
set termguicolors

" set cursor back to underline on exit
au VimLeave * set guicursor=a:hor20

" clear search buffer on startup
au VimEnter * :let @/=""

" remember cursor position from last session
au BufReadPost *.rs,*.c,*.h,*.cpp,*.hpp,*.py,*.clj
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" colorscheme
let preferred_color_scheme = "molokai"

" make screen scroll 7 lines before end
set scrolloff=7

" preserve file creaton time
set backupcopy=yes

let g:markdown_composer_open_browser = 0

" use sh as the internal shell because many utilities are designed around it
set shell=sh "you may have to switch this back to bash

" make grammarous use vim's interal spell checker
let g:grammarous#use_vim_spelllang = 1

" xml/html tag auto close
let g:xmledit_enable_html = 1
let g:xml_use_xhtml = 1

" fix proper syntax highlighting in shell scripts
let g:is_posix = 1

" make C syntax highlighting the default for .h files
let g:c_syntax_for_h = 1

" inform vim that you are using two spaces as sentence separators
set cpo+=J

" disable line wrapping all together
set nowrap

" disable .netrwhist files from being generated
let g:netrw_dirhistmax = 0

" set tabs to be 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" allows 24-bit colors in terminal
setlocal termguicolors

" set colorscheme or use included fallback
try
    execute "colorscheme " . preferred_color_scheme
catch
    colorscheme badwolf
endtry

" make comments italic
hi Comment cterm=italic gui=italic


source ~/.config/nvim/filecommands.vim

source ~/.config/nvim/functions.vim

