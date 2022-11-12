"------------------------------------------------------------------------------"
"---------------------------- vim-plug plugin list ----------------------------"
"------------------------------------------------------------------------------"


" realtime markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" fish script syntax highlighting
"Plug 'nickeb96/fish.vim'
Plug '~/Repositories/fish.vim'

" pest grammar files
Plug 'pest-parser/pest.vim'

" wgsl shader files
Plug 'DingDean/wgsl.vim'

" language server client
Plug 'neovim/nvim-lspconfig'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" tree sitter based auto pairs
Plug 'windwp/nvim-autopairs'

" tree sitter highlight nvim under cursor
Plug 'nvim-treesitter/playground'

" text file and markdown editing
"Plug 'reedes/vim-pencil'

" toml syntax highlighting
"Plug 'cespare/vim-toml'

" color schemes
"Plug 'rafi/awesome-vim-colorschemes'

" molokai color scheme
Plug 'piersy/molokai'

" sonokai color scheme
Plug 'sainnhe/sonokai'

" opengl shader syntax highlighting
Plug 'tikhomirov/vim-glsl'

" grammer checker
"Plug 'rhysd/vim-grammarous'

" xml/html tag closing
Plug 'sukima/xmledit'

" .md table formating
Plug 'godlygeek/tabular'

" wrapper for gdb and lldb
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" swift syntax highlighting
Plug 'keith/swift.vim'

