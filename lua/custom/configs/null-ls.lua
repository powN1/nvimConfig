local null_ls = require "null-ls"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local util = require "lspconfig.util"

local sources = {

  -- webdev stuff
  b.formatting.biome.with {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    -- root_dir = util.root_pattern('biome.json', 'biome.jsonc'),
    -- default_config = {
    --   root_dir = [[root_pattern('biome.json', 'biome.jsonc')]],
    -- },
  },
  -- b.formatting.deno_fmt.with { extra_args = { "--line-width", "120", "--arrow-parens", "always" } }, -- chose deno for ts/js files cuz its very fast!
  -- b.formatting.prettierd.with { extra_args = { "--print-width=120" } }, -- chose deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } }, -- so prettierd works only on these filetypes
  -- b.diagnostics.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  --------- Autoformatting on save ----------
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format()
        end,
      })
    end
  end,
  --------------------------------------------
}
