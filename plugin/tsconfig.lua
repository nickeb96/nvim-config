
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.rust = {
  install_info = {
    url = "~/Repositories/tree-sitter-rust",
    files = {"src/parser.c", "src/scanner.c"},
  },
}
parser_config.markdown = {
  install_info = {
    url = "~/Repositories/tree-sitter-markdown/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "markdown",
}
parser_config.markdown_inline = {
  install_info = {
    url = "~/Repositories/tree-sitter-markdown/tree-sitter-markdown-inline",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "markdown",
}

--require"nvim-treesitter.highlight".set_custom_captures { ["namespace.special"] = "TSNamespaceSpecial", }

require"nvim-treesitter.configs".setup {
  -- A list of parser names, or "all"
  ensure_installed = { "rust", "lua", "regex", "scheme", "markdown", "markdown_inline", "html" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    --custom_captures = { ["namespace.special"] = "TSNamespaceSpecial" },
  },
  intdent = {
    enable = { "rust", "lua" },
  },
  fold = { "rust" },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes Note that setting an entry here replaces all other
    -- patterns for this entry.  By setting the 'default' entry below, you can
    -- control which nodes you want to appear in the context window.
    default = {
      -- 'class',
      'function',
      'method',
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    },
    -- Example for a specific filetype.  If a pattern is missing, *open a
    -- PR* so everyone can benefit.
    rust = {
      'impl_item',
    },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns Treat patterns.rust as
    -- a Lua pattern (i.e "^impl_item$" will exactly match "impl_item" only)
    -- rust = true,
  },
}

require"vim.treesitter.query".set_query("rust", "highlight", "(identifier) @type")

require"nvim-autopairs".setup {
  disable_filetype = {"markdown"},
  check_ts = true,
  ts_config = {
    markdown = false,
    markdown_inline = false,
  },
}

