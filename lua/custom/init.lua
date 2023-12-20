-- local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

-- sets the amount of items to show in a popup window (autocompletion)
opt.pumheight = 13

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
