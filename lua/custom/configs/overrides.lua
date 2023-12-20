local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
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
      "html"
    },
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
    "emmet_ls",
    "deno",
    "prettier",

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
      show = {
        git = true,
      },
    },
  },
}

-- require("nvim-web-devicons").setup {}
return M
