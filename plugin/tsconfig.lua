
if not pcall(require, "nvim-treesitter") then
  vim.print("nvim-treesitter not installed")
  return
end

local parsers = require("nvim-treesitter.parsers")
local parser_configs = parsers.get_parser_configs()

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "rust", "lua", "regex", "comment", "markdown", "markdown_inline", "latex",
    "python", "html", "css", "javascript", "toml", "query", "vim", "vimdoc",
    "bash", "c"
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
  -- fold = { "rust", "markdown" },
  fold = {
    enable = true,
  },
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

