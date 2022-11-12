
call plug#begin('~/.local/share/nvim/site/plugs')
source ~/.config/nvim/plugs.vim
call plug#end()


" use true colors instead of default
set termguicolors

" set cursor back to underline on exit
au VimLeave * set guicursor=a:hor20

" clear search register on startup and exit
au VimEnter * let @/=''
au VimLeave * let @/=''

" enable syntax based folding
set foldmethod=expr
set foldlevelstart=0
"au BufRead * normal zR

" remember cursor position from last session
au BufReadPost *.rs,*.c,*.h,*.cpp,*.hpp,*.py,*.scm,*.js
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" highlight yanked test for a bit
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=500 }

" colorscheme
let main_color_scheme = "rusted"

" make screen scroll 10 lines before end
set scrolloff=10

" use hybrid relative/absolute line numbers
set relativenumber
set number

" allow mouse to be used in visual and insert mode
set mouse=vi

" preserve file creaton time
set backupcopy=yes

" make ex command line only appear in command mode
set cmdheight=1 "I've disabled this temporarily because it fails to show up with macros and other cmd mode tools

" prevent opening history
"nnoremap q <nop>

" delete history on exit
au VimLeave * call histdel(':')

" use sh as the internal shell
set shell=sh

" ignore case on tab completion of commands and functions
"set ignorecase "dont use this because it messes up regex searching
"set wildignorecase

" use custom US English dictionary instead of all English subsets
set spelllang=en,personal

" make grammarous use vim's interal spell checker
let g:grammarous#use_vim_spelllang = 1

" make statusline show useful information
set statusline=%<%f\ \ %h%m%r%=%a%=%y\ \ \ %{&fileencoding}\ \ \ 0x%02.2B\ \ \ %-14.(%l:%c%V%)\ %P
"au FileType pdf setlocal rulerformat=BYTE:\ %o

" xml/html tag auto close
let g:xmledit_enable_html = 1
let g:xml_use_xhtml = 1

" turn off auto scrolling in markdown preview
let g:mkdp_preview_options = { 'disable_sync_scroll': 1 }

" fix syntax highlighting in shell scripts
let g:is_posix = 1

" use C syntax highlighting the default for .h files
let g:c_syntax_for_h = 1

" inform vim that you are using two spaces as sentence separators
set cpoptions+=J
set joinspaces
set spellcapcheck=[.?!]\ \\{2}

" disable line wrapping all together
set nowrap

" override background color for sonokai
let g:sonokai_colors_override = {'bg0': ['#1d1f21', '234']}

" disable .netrwhist files from being generated
let g:netrw_dirhistmax = 0

" disable netrw banner
let g:netrw_banner = 0

" set tabs to be 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" set colorscheme or use included fallback
try
    execute 'colorscheme ' . main_color_scheme
catch
    colorscheme badwolf
endtry


source ~/.config/nvim/filecommands.vim
source ~/.config/nvim/functions.vim

