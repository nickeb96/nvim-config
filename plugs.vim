"------------------------------------------------------------------------------"
"---------------------------- vim-plug plugin list ----------------------------"
"------------------------------------------------------------------------------"


" realtime markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" fish script syntax highlighting (merged into vim; no longer needed)
"Plug 'nickeb96/fish.vim'

" pest grammar files
Plug 'pest-parser/pest.vim'

" arm assembly files
Plug 'ARM9/arm-syntax-vim'

" wgsl shader files
Plug 'DingDean/wgsl.vim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" tree sitter context header lines
Plug 'nvim-treesitter/nvim-treesitter-context'

" tree sitter text objects
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" tree sitter based auto pairs
Plug 'windwp/nvim-autopairs'

" tree sitter highlight nvim under cursor
Plug 'nvim-treesitter/playground'

" xml/html tag closing
Plug 'windwp/nvim-ts-autotag'

" molokai color scheme
Plug 'piersy/molokai'

" sonokai color scheme
Plug 'sainnhe/sonokai'

" nordic color scheme
Plug 'AlexvZyl/nordic.nvim'

" opengl shader syntax highlighting
Plug 'tikhomirov/vim-glsl'

" adds ys cs ds operators to insert, change, and delete surroundings
Plug 'tpope/vim-surround'

" adds gc operator for commenting
Plug 'tpope/vim-commentary'

" adds cr operator for coercing between snake_cases, PascalCase, etc.
Plug 'tpope/vim-abolish'

" ledger support
Plug 'ledger/vim-ledger'

" .md table formating
Plug 'godlygeek/tabular'

" wrapper for gdb and lldb
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" swift syntax highlighting
Plug 'keith/swift.vim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

