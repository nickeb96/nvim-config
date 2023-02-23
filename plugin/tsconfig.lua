
local parsers = require("nvim-treesitter.parsers")
local parser_configs = parsers.get_parser_configs()
parser_configs.rust = {
  install_info = {
    url = "https://github.com/nickeb96/tree-sitter-rust",
    revision = "master",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "rust", "lua", "regex", "scheme", "markdown", "markdown_inline",
    "python", "html", "javascript"
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
  indent = {
    enable = { "rust", "lua" },
  },
  fold = { "rust" },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "+",
      node_decremental = "-",
      init_selection = false,
      scope_incremental = false,
    },
  },
}

require("treesitter-context").setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes Note that setting an entry here replaces all other
    -- patterns for this entry.  By setting the 'default' entry below, you can
    -- control which nodes you want to appear in the context window.
    default = {
      "function",
      "method",
    },
    -- Example for a specific filetype.  If a pattern is missing, *open a
    -- PR* so everyone can benefit.
    rust = {
      "impl_item",
    },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns Treat patterns.rust as
    -- a Lua pattern (i.e "^impl_item$" will exactly match "impl_item" only)
    -- rust = true,
  },
}

local autopairs_config = require("nvim-autopairs")
autopairs_config.setup {
  disable_filetype = {"markdown"},
  check_ts = true,
  ts_config = {
    markdown = false,
    markdown_inline = false,
  },
}
autopairs_config.remove_rule("`")

require("nvim-ts-autotag").setup()

