local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "emmet_language_server", "pyright", "tailwindcss",  }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "eruby", "html", "javascript", "javascriptreact", "svelte", "pug", "typescriptreact", "vue" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

vim.diagnostic.config {
  virtual_text = false,
  -- virtual_text = {
  float = { border = "rounded" },
  --   source = "always", -- Or "if_many"
  -- },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}
-- If you want diagnostics on errore hover
-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat lua guibg=#1f2335 guifg=#abb2bf]]
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--
-- lspconfig.pyright.setup { blabla}
