-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {

  -- List of all available tabufline highlights are in '.local/share/nvim/lazy/base46/integrations/tbline.lua'
  -- This makes sure that active buffer is visible on the top file bar
  -- The number in the object lightens the selected color with positive numbers and darkens with negative
  -- Currently tbline file is modified so it doesn't take active tabs into account when the theme is set to transparent
  -- If it doesn't work on updates then use lines below as backup

  -- TblineFill = { bg = "one_bg3" },
  -- TbLineBufOn = { bg = { "one_bg3", 0 } },
  -- TbLineBufOnClose = { bg = { "one_bg3", 0 } },
  -- TbLineBufOnModified = { bg = { "one_bg3", 0 } },

  Comment = { italic = false },

  -- Color of the current line when editing
  CursorLine = { bg = { "one_bg3", -0 } },

  -- Color of the current line when selecting files in telescope
  TelescopeSelection = { bg = "one_bg3" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}
return M
