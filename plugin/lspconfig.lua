local lsp = require("lsp-zero").preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})
lsp.configure("rust_analyzer", {
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
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
  end
}
lsp.setup_nvim_cmp {
  mapping = lsp.defaults.cmp_mappings {
    ["<C-f>"] = cmp.mapping.confirm(),
  }
}
lsp.setup()
