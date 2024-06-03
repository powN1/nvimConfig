local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "c",
    "python",
    "markdown",
    "markdown_inline",
    "comment",
  },
  indent = {
    enable = true,
    -- ts indentation disabled for html as it was messing up new lines
    disable = {
      "html",
    },
  },
  highlight = {
    enable = true,
    disable = { "txt" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  playground = {
    -- Enable treesitter playground plugin
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-language-server",
    "tailwindcss-language-server",
    "deno",
    "prettierd",
    "eslint_d",
    "biome",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    --python
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      -- glyphs = {
      --   folder = {
      --     -- default = "",
      --   },
      -- },
      show = {
        git = true,
      },
    },
  },
}

-- if you want to change webdev icons color etc
-- require("nvim-web-devicons").setup {
-- }
return M
