
local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup {
  completion = {
    autocomplete = false,
    completeopt = "menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
  },
  enabled = true,
  view = {
    docs = {
      auto_open = false,
    }
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<C-s>"] = function(fallback)
      cmp.confirm()
    end,
    ["<C-n>"] = function(fallback)
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_clients()
      local client_id = clients[1] ~= nil and clients[1].id or -1
      if cmp.visible() then
        cmp.select_next_item({ behavior = "select" })
      elseif vim.api.nvim_get_mode().mode == "i" and vim.lsp.buf_is_attached(bufnr, client_id) then
        cmp.complete()
      else
        fallback()
      end
    end,
    ["<C-p>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = "select" })
      else
        fallback()
      end
    end,
  },
  formatting = {
    fields = {"abbr", "kind"},
    format = function(entry, item)
			return item
		end,
  },
  sorting = {
    priority_weight = 1.0,
    comparators = {
      function(a, b)
        return cmp.config.compare.kind(b, a)
      end,
      cmp.config.compare.exact,
      cmp.config.compare.sort_text,
      cmp.config.compare.scope,
      -- cmp.config.compare.offset,
			-- cmp.config.compare.score,
			cmp.config.compare.recently_used,
    },
  },
}

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.rust_analyzer.setup({
  capabilities = default_capabilities,
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
lspconfig.basedpyright.setup({
  capabilities = default_capabilities,
  settings = {
    basedpyright = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportMissingTypeStubs = false,
          reportAny = false,
          reportUnusedCallResult = false,
          reportUnusedImport = false,
          reportInconsistentOverload = false,
          reportMissingTypeArgument = false,
          reportMissingParameterType = false,
          reportUnusedParameter = false,
          reportUnknownArgumentType = false,
          reportUnknownLambdaType = false,
          reportUnknownMemberType = false,
          reportUnknownParameterType = false,
          reportUnknownVariableType = false,
          reportDeprecated = false,
          reportImplicitOverride = false,
        }
      }
    }
  }
})
lspconfig.lua_ls.setup({
  capabilities = default_capabilities,
})
lspconfig.ts_ls.setup({
  capabilities = default_capabilities,
})
lspconfig.cssls.setup({
  capabilities = default_capabilities,
})
lspconfig.clangd.setup({
  capabilities = default_capabilities,
})
lspconfig.harper_ls.setup({
  capabilities = default_capabilities,
  settings = {
    ["harper-ls"] = {
      linters = {
        spell_check = false,
        spelled_numbers = false,
        an_a = true,
        sentence_capitalization = false,
        unclosed_quotes = true,
        wrong_quotes = false,
        long_sentences = true,
        repeated_words = true,
        spaces = false,
        matcher = true,
        correct_number_suffix = true,
        number_suffix_capitalization = true,
        multiple_sequential_pronouns = true,
        linking_verbs = false,
        avoid_curses = true,
      }
    }
  }
})


vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  float = {
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
  },
}

vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-s>", vim.lsp.buf.code_action)

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
  end
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

