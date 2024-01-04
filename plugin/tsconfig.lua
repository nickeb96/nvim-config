
if not pcall(require, "nvim-treesitter") then
  vim.print("nvim-treesitter not installed")
  return
end

local parsers = require("nvim-treesitter.parsers")
local parser_configs = parsers.get_parser_configs()
-- parser_configs.rust = {
--   install_info = {
--     url = "https://github.com/nickeb96/tree-sitter-rust",
--     -- url = "~/Repositories/tree-sitter-rust",
--     revision = "master",
--     files = { "src/parser.c", "src/scanner.c" },
--   },
-- }

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "rust", "lua", "regex", "comment", "markdown", "markdown_inline", "latex",
    "python", "html", "css", "javascript", "query", "vim", "vimdoc", "bash", "c"
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  locals = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = false,
      clear_on_cursor_move = false,
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      -- keymaps = {
      --   smart_rename = "grr",
      -- },
    },
  },
  fold = { "rust", "markdown" },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "+",
      node_decremental = "-",
      init_selection = false,
      scope_incremental = false,
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["agc"] = "@comment.outer",
        ["igc"] = "@comment.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.outer",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.outer",
        ["ai"] = "@impl.outer",
        ["ii"] = "@impl.outer",
      },
      selection_modes = {
        -- ["@function.around"] = "v",
        -- ["@function.outer"] = "V",
      },
      include_surrounding_whitespace = function(text_obj)
        local suffix = "around"
        local query_string = text_obj.query_string
        -- local sm = text_obj.selection_mode
        return query_string:sub(#query_string - #suffix + 1) == suffix
      end,
    },
  },
}

-- require("treesitter-context").setup {
--   enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--   max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
--   trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
--     -- For all filetypes Note that setting an entry here replaces all other
--     -- patterns for this entry.  By setting the 'default' entry below, you can
--     -- control which nodes you want to appear in the context window.
--     default = {
--       "function",
--       "method",
--     },
--     -- Example for a specific filetype.  If a pattern is missing, *open a
--     -- PR* so everyone can benefit.
--     rust = {
--       "impl_item",
--     },
--   },
--   exact_patterns = {
--     -- Example for a specific filetype with Lua patterns Treat patterns.rust as
--     -- a Lua pattern (i.e "^impl_item$" will exactly match "impl_item" only)
--     -- rust = true,
--   },
-- }

local autopairs = require("nvim-autopairs")
autopairs.setup {
  check_ts = true,
  ts_config = {
    markdown = false,
    markdown_inline = false,
  },
  disable_filetype = { "markdown", "text" },
}
autopairs.remove_rule("`")

require("nvim-ts-autotag").setup()

