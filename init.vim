
" reduce shada jump records to 5 files and disable '/' history
set shada=!,'5,<100,s4,h,/0,:10,@0
set history=10

call plug#begin('~/.local/share/nvim/site/plugs')
source ~/.config/nvim/plugs.vim
call plug#end()

" use true colors instead of default
set termguicolors

augroup setcursor
    autocmd!
    " set cursor back to underline on exit
    au VimLeave * set guicursor=a:hor20
    " change terminal between suspend (ctrl-z) and resume (command fg)
    au VimSuspend * set guicursor=a:hor20
    au VimResume * set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
augroup END

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
augroup remembercursor
    autocmd!
    au BufReadPost *.rs,*.c,*.h,*.py,*.vim,*.lua,*.scm,*.html,*.css,*.js
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
augroup END

" highlight yanked test for a bit
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=500 }

" colorscheme
let main_color_scheme = "rusted"

" make statusline show useful information
set statusline=%<%f\ \ %h%m%r%=%a%=%y\ \ \ %{&fileencoding}\ %6.(0x%02.B%)\ \ %7.((%o)%)\ \ \ %-10.(%l:%c%V%)\ \ %P

" have only one status line instead of one per window
set laststatus=3

" make screen scroll 10 lines before end
let g:desired_scrolloff = 10
let &scrolloff = g:desired_scrolloff

" make CTRL-U and CTRL-D move 10 lines at a time
let g:desired_scroll = 10
let &scroll = g:desired_scroll

" make CTRL-U and CTRL-D center the screen on the cursor after (setting
" scrolloff fixes a bug with scrolling at the beginning or end of the file)
nnoremap <silent> <C-d> :set scrolloff=0<Enter><C-d>zz:let &scrolloff=g:desired_scrolloff<Enter>
nnoremap <silent> <C-u> :set scrolloff=0<Enter><C-u>zz:let &scrolloff=g:desired_scrolloff<Enter>

" have / prepend \v to make +, |, () not need escape
" nnoremap / /\v

" use ? for :nohl instead of reverse search
nnoremap <silent> ? :nohl<Enter>:echon ''<Enter>
vnoremap <silent> ? :nohl<Enter>:echon ''<Enter>

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

" allow mouse to be used in normal, visual, and insert mode
"set mouse=nvi
set mouse=

" map scroll wheel to screen scrolling instead of cursor vertical movement
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" preserve file creaton time
set backupcopy=yes

" make ex command line only appear in command mode
set cmdheight=1 "I've disabled this temporarily because it fails to show up with macros and other cmd mode tools

" use sh as the internal shell
set shell=sh

" folding based on section
let g:markdown_folding = 1

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

" list mode chars
set listchars=eol:\\u21B5,tab:\\u2504\\u2504\\u2524,space:\\u2022,nbsp:\\u25a0
            \,trail:\\u2593,extends:\\u2192,precedes:\\u2190

" disable nroff directives for paragraph motions
set paragraphs=

" set tabs to be 4 spaces
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1

" set colorscheme or use included fallback
try
    execute 'colorscheme ' .. main_color_scheme
catch
    colorscheme badwolf
endtry

source ~/.config/nvim/filecommands.vim
source ~/.config/nvim/functions.vim

