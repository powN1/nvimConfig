local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options

  -- //////////////////////////////////////////////////////////////////////
  -- /// Plugins turned off in vscode
  -- //////////////////////////////////////////////////////////////////////
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    cond = (function() return not vim.g.vscode end)
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    cond = (function() return not vim.g.vscode end)
  },

  -- Live server for html
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    config = function()
      require "custom.configs.liveserver"
      return true
    end,
    cmd = { "LiveServerStart", "LiveServerStop" },
    cond = (function() return not vim.g.vscode end)
  },

  -- TSPlayground for checking highlight groups etc.
  { "nvim-treesitter/playground", 
    cmd = { "TSHighlightCapturesUnderCursor", "TSNodeUnderCursor" },
    cond = (function() return not vim.g.vscode end)
  },

  -- Rainbow brackets
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require "custom.configs.rainbowdelimiters"
    end,
    -- Has to be loaded on startup in order to work from the get-go
    lazy = false,
    cond = (function() return not vim.g.vscode end)
  },
  -- Managing splits size and location
  { 
    "mrjones2014/smart-splits.nvim",
    cond = (function() return not vim.g.vscode end)
  },

  -- File navigation
  {
    "stevearc/oil.nvim",
    config = function()
      require "custom.configs.oil"
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    cond = (function() return not vim.g.vscode end)
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cond = (function() return not vim.g.vscode end)
  },
  {
    "windwp/nvim-ts-autotag",
    -- dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.ts-autotag"
    end,
    -- The plugin won't work without even = "verylazy" for some reason
    event = "VeryLazy",
    cond = (function() return not vim.g.vscode end)
  },
  {
    "tpope/vim-obsession",
    -- config = function()
    --   require "custom.configs.session-manager"
    -- end,
    lazy = false,
    -- cmd = { "SessionManager" },
    cond = (function() return not vim.g.vscode end)
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require "custom.configs.statuscol"
        end,
      },
    },
    config = function()
      require "custom.configs.ufo"
    end,
    event = "BufReadPost",
    cond = (function() return not vim.g.vscode end)
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPost",
    cond = (function() return not vim.g.vscode end)
  },

  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = {}, -- your configuration
  --   lazy = false,
  --   cond = (function() return not vim.g.vscode end)
  -- },

  -- { 
  --   "dsznajder/vscode-es7-javascript-react-snippets", 
  --   build = "yarn install --frozen-lockfile && yarn compile",
  --   cond = (function() return not vim.g.vscode end)
  -- },
  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    -- enabled = false,
    config = function()
      require("colorizer").setup {
        user_default_options = {
          tailwind = true,
        },
      }
    end,
    lazy = false,
    cond = (function() return not vim.g.vscode end)
  },


  -- //////////////////////////////////////////////////////////////////////
  -- /// Plugins turned on in vscode
  -- //////////////////////////////////////////////////////////////////////


  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- format & linting
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Comments for jsx/tsx
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require "custom.configs.leap"
    end,
    lazy = false,
  },
  --
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
