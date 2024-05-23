-- if vim.g.vscode then
--   -- Define the leader key if not already defined
--   vim.g.mapleader = " " -- This sets leader to space
--
--   -- Map <leader>x to close the current tab in VSCode
--
--   vim.api.nvim_set_keymap(
--     "n",
--     "<leader>x",
--     ':call VSCodeCall("workbench.action.closeActiveEditor")<CR>',
--     { noremap = true, silent = true }
--   )
-- else
-- ordinary Neovim
require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})
-- end
