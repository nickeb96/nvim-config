local lsp = require("lsp-zero").preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})
lsp.on_attach(function(_client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {buffer = true})
end)
lsp.configure("rust_analyzer", {
  on_attach = function(client)
    -- client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        }
      }
    }
  }
})
lsp.nvim_workspace()


local cmp = require("cmp")
cmp.setup {
  enabled = function()
    return vim.g.ENABLE_TAB_COMPLETION
  end,
}
lsp.setup_nvim_cmp {
  -- preselect = "none",
  completion = {
    -- completeopt = 'menu,menuone,noinsert,noselect'
  },
  mapping = lsp.defaults.cmp_mappings {
    ["<C-f>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.config.disable,
    ["<CR>"] = cmp.config.disable,
  }
}
lsp.setup()
