
local disable_lsp = true

local has_module = pcall(require, "lsp-zero")
if not has_module or disable_lsp then
  -- vim.print("lsp-zero not not installed")
  return
end

local lsp = require("lsp-zero").preset({
  name = "minimal",
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  -- client.server_capabilities.semanticTokensProvider = nil

  -- vim.opt.formatexpr = vim.lsp.formatexpr

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {buffer = true})
end)

lsp.configure("rust_analyzer", {
  -- on_attach = function(client)
  --   client.server_capabilities.semanticTokensProvider = nil
  --   client.rustfmt.rangeFormatting.enable = true
  --   print("This is a test")
  --   local function f()
  --     f()
  --   end
  --   f()
  --   client.rustfmt.tuheoneuhto.htuenohtn.euhtunohuteno.hutenohunt = true
  -- end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      procMacro = {
        enable = true,
      },
      notifications = {
        cargoTomlNotFound = false,
      },
      rustfmt = {
        rangeFormatting = {
          enable = true,
        }
      },
    }
  }
})

-- lsp.configure("pylyzer", {
--   settings = {
--     ["pylyzer"] = {},
--   }
-- })

lsp.nvim_workspace()

local cmp = require("cmp")
cmp.setup {
  enabled = function()
    return vim.g.ENABLE_TAB_COMPLETION
  end,
  window = {
    -- completion = cmp.config.window.borderless(),
    documentation = cmp.config.window.bordered(),
  },
}

lsp.setup_nvim_cmp {
  -- preselect = "none",
  completion = {
    -- completeopt = 'menu,menuone,noinsert,noselect'
  },
  mapping = lsp.defaults.cmp_mappings {
    ["<C-s>"] = cmp.mapping.confirm(),
    ["<C-n>"] = function(fallback)
      local bufnr = vim.api.nvim_get_current_buf()
      local client = vim.lsp.get_clients()[1].id
      if cmp.visible() then
        cmp.select_next_item({behavior = "select"})
      elseif vim.api.nvim_get_mode().mode == "i" and vim.lsp.buf_is_attached(bufnr, client) then
        cmp.complete()
      else
        fallback()
      end
    end,
    ["<Tab>"] = cmp.config.disable,
    ["<CR>"] = cmp.config.disable,
    ["<C-e>"] = cmp.config.disable,
    ["<C-]>"] = cmp.config.disable,
  }
}
lsp.setup()


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = {
      {"▄", "FloatBorder"},
      {"▄", "FloatBorder"},
      {"▄", "FloatBorder"},
      {"█", "FloatBorder"},
      {"▀", "FloatBorder"},
      {"▀", "FloatBorder"},
      {"▀", "FloatBorder"},
      {"█", "FloatBorder"},
    },
  }
)

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
--   -- opts.border = {
--   --   {"\u{2582}", "FloatBorder"}, -- top left
--   --   {"\u{2582}", "FloatBorder"}, -- top
--   --   {"\u{2582}", "FloatBorder"}, -- top right
--   --   {"\u{2590}", "FloatBorder"}, -- left
--   --   {" ", "FloatBorder"}, -- bottom left
--   --   {"\u{2582}", "FloatBorder"}, -- bottom
--   --   {" ", "FloatBorder"}, -- bottom right
--   --   {"\u{258C}", "FloatBorder"}, -- right
--   -- }
--   opts.border = {
--     {"▄", "FloatBorder"},
--     {"▄", "FloatBorder"},
--     {"▄", "FloatBorder"},
--     {"█", "FloatBorder"},
--     {"▀", "FloatBorder"},
--     {"▀", "FloatBorder"},
--     {"▀", "FloatBorder"},
--     {"█", "FloatBorder"},
--   }
--   -- opts.pad_left = 3
--   -- opts.pad_right = 5
--   -- opts.pad_top = 2
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

