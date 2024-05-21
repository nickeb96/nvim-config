"------------------------------------------------------------------------------"
"---------------------------- vim-plug plugin list ----------------------------"
"------------------------------------------------------------------------------"


" realtime markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" .md table formating
Plug 'godlygeek/tabular'

" fish script syntax highlighting (merged into vim; no longer needed)
"Plug 'nickeb96/fish.vim'

" pest grammar files
Plug 'pest-parser/pest.vim'

" arm assembly files
Plug 'ARM9/arm-syntax-vim'

" wgsl shader files
Plug 'DingDean/wgsl.vim'

" ledger support
Plug 'ledger/vim-ledger'

" swift syntax highlighting
Plug 'keith/swift.vim'

" opengl shader syntax highlighting
Plug 'tikhomirov/vim-glsl'

" adds ys cs ds operators to insert, change, and delete surroundings
Plug 'tpope/vim-surround'

" adds gc operator for commenting
Plug 'tpope/vim-commentary'

" adds cr operator for coercing between snake_cases, PascalCase, etc.
Plug 'tpope/vim-abolish'

" patch . repeating for vim-abolish and vim-surround
Plug 'tpope/vim-repeat'

" sonokai color scheme
Plug 'sainnhe/sonokai'
" let g:sonokai_colors_override = { 'bg0': ['#12171d', '234'] }
let g:sonokai_colors_override = { 'bg0': ['#141414', '234'] }

" nordic color scheme
Plug 'AlexvZyl/nordic.nvim'

" catppuccin color scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" everforest color scheme
Plug 'sainnhe/everforest'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" treesitter context header lines
Plug 'nvim-treesitter/nvim-treesitter-context'

" treesitter text objects
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" treesitter based auto pairs
Plug 'windwp/nvim-autopairs'

" treesitter identifier definition highlighting
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" treesitter xml/html tag closing
Plug 'windwp/nvim-ts-autotag'

" lsp Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" autocompletion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" snippets
" Plug 'L3MON4D3/LuaSnip'

" lsp zero
" Plug 'VonHeikemen/lsp-zero.nvim', { 'branch': 'v1.x' }

" inline hexcolor display
Plug 'norcalli/nvim-colorizer.lua'

" fuzzy finder
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

" romaji to hirigana
Plug 'vim-skk/eskk.vim'

