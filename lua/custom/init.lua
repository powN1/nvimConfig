-- Check "after" folder for some commands that had to applied there in order to take effect.

local opt = vim.opt

-- sets the amount of items to show in a popup window (autocompletion)
opt.pumheight = 13
opt.relativenumber = true

opt.foldcolumn = "1"
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
