---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- Move current line up or down
    ["<A-j>"] = { "<cmd>:m+<CR>" },
    ["<A-k>"] = { "<cmd>:m-2<CR>" },

    -- Center the view when scrolling
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },

    -- Open oil navigation
    ["-"] = { "<cmd> Oil<CR>", "Open parent directory" },

    -- Open and close all folds (ufo)
    -- ["<zO>"] = { "<cmd>lua require('ufo').openAllFolds()<CR>" },
    -- ["<zC>"] = { "<cmd>lua require('ufo').closeAllFolds()<CR>" },
    --
    -- For window resizing and buffer swapping between windows
    ["<C-Left>"] = {
      function()
        require("smart-splits").resize_left(2)
      end,
    },
    ["<C-Down>"] = {
      function()
        require("smart-splits").resize_down(2)
      end,
    },
    ["<C-Up>"] = {
      function()
        require("smart-splits").resize_up(2)
      end,
    },
    ["<C-Right>"] = {
      function()
        require("smart-splits").resize_right(2)
      end,
    },
    ["<A-Left>"] = {
      function()
        require("smart-splits").swap_buf_left()
      end,
    },
    ["<A-Down>"] = {
      function()
        require("smart-splits").swap_buf_down()
      end,
    },
    ["<A-Up>"] = {
      function()
        require("smart-splits").swap_buf_up()
      end,
    },
    ["<A-Right>"] = {
      function()
        require("smart-splits").swap_buf_right()
      end,
    },
    -- ["<leader>tt"] = {
    --   function()
    --     require("base46").toggle_transparency()
    --   end,
    --   "Toggle transparency",
    -- },
    -- -- for running live server
    -- ["<C-z>"] = { "<cmd> LiveServerStart<CR>", "Start live server" },

    -- Open trouble plugin and show errors
    ["<leader>te"] = { "<cmd>TroubleToggle<CR>" },
  },
  i = {
    -- Save file in insert mode
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },

    -- Move current line up or down in insert mode
    ["<A-j>"] = { "<ESC><cmd>:m.+1<CR>" },
    ["<A-k>"] = { "<ESC><cmd>:m.-2<CR>" },
  },
  v = {
    [">"] = { ">gv", "indent" },

    -- Save file in visual mode
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },

    -- Move selected lines up or down in visual mode
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
  },
}
M.comment = {
  plugin = true,

  -- toggle comment in both modes
  -- windows(os) can't really tell a difference between "C-/" and "C-_" therefore bound the same action to both keystrokes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}
-- more keybinds!

return M
