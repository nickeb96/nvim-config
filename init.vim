
" reduce shada jump records to 5 files and disable '/' history
set shada=!,'5,<100,s4,h,/0,:10,@0
set history=10

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

" disable lsp diagnostic column
set signcolumn=no

" remember cursor position from last session
au BufReadPost *.rs,*.c,*.h,*.cpp,*.hpp,*.py,*.scm,*.js,*.vim
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" highlight yanked test for a bit
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=500 }

" colorscheme
let main_color_scheme = "rusted"

" make screen scroll 10 lines before end
set scrolloff=10

" make CTRL-U and CTRL-D move 10 lines at a time
set scroll=10

" make CTRL-U and CTRL-D center the screen on the cursor after (setting
" scrolloff fixes a bug with scrolling at the beginning or end of the file)
nnoremap <silent> <C-d> :set scrolloff=0<Enter><C-d>zz:set scrolloff=10<Enter>
nnoremap <silent> <C-u> :set scrolloff=0<Enter><C-u>zz:set scrolloff=10<Enter>

" use hybrid relative/absolute line numbers
set relativenumber
set number

" toggle tab completion in plugin/lspconfig.lua
if !exists("g:ENABLE_TAB_COMPLETION")
    let g:ENABLE_TAB_COMPLETION = v:false
endif
nnoremap <silent> g<Tab> :let g:ENABLE_TAB_COMPLETION = g:ENABLE_TAB_COMPLETION == v:true ? v:false : v:true<Enter>

" allow selected text to be moved up or down with J and K
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" use L to run something in lua
nnoremap L :lua 

" allow mouse to be used in normal, visual, and insert mode
"set mouse=nvi
set mouse=

" preserve file creaton time
set backupcopy=yes

" make ex command line only appear in command mode
set cmdheight=1 "I've disabled this temporarily because it fails to show up with macros and other cmd mode tools

" prevent opening history
"nnoremap q <nop>

" use sh as the internal shell
set shell=sh

" ignore case on tab completion of commands and functions
"set ignorecase "dont use this because it messes up regex searching
"set wildignorecase

" use custom US English dictionary instead of all English subsets
set spelllang=en,personal

" make statusline show useful information
set statusline=%<%f\ \ %h%m%r%=%a%=%y\ \ \ %{&fileencoding}\ %6.(0x%02.B%)\ \ %7.((%o)%)\ \ \ %-10.(%l:%c%V%)\ \ %P
"au FileType pdf setlocal rulerformat=BYTE:\ %o  %-8.((%o)%)

" have only one status line instead of one per window
set laststatus=3

" xml/html tag auto close
let g:xmledit_enable_html = 1
let g:xml_use_xhtml = 1

" turn off auto scrolling in markdown preview
let g:mkdp_preview_options = { 'disable_sync_scroll': 1 }

" fix syntax highlighting in shell scripts
let g:is_posix = 1

" use C syntax highlighting for .h files instead of C++
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

" make netrw open files in new vertical windows with a width of 90 columns
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_winsize = -90

" set tabs to be 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" TODO: remove these lines
" set conceallevel=2
" set concealcursor=n

" set colorscheme or use included fallback
try
    execute 'colorscheme ' . main_color_scheme
catch
    colorscheme badwolf
endtry

source ~/.config/nvim/filecommands.vim
source ~/.config/nvim/functions.vim

