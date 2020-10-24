"------------------------------------------------------------------------------"
"---------------------------- vim-plug plugin list ----------------------------"
"------------------------------------------------------------------------------"


" realtime markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" fish script syntax highlighting
Plug 'dag/vim-fish'

" rust syntax highlighting
Plug 'rust-lang/rust.vim'

" text file and markdown editing
Plug 'reedes/vim-pencil'

" toml syntax highlighting
Plug 'cespare/vim-toml'

" color schemes
"Plug 'rafi/awesome-vim-colorschemes'

" molokai color scheme
Plug 'piersy/molokai'

" opengl shader syntax highlighting
Plug 'tikhomirov/vim-glsl'

" grammer checker
Plug 'rhysd/vim-grammarous'

" xml/html tag closing
Plug 'sukima/xmledit'

" .md table formating
Plug 'godlygeek/tabular'

" wrapper for gdb and lldb
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" swift syntax highlighting
Plug 'keith/swift.vim'

