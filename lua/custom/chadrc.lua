---@type ChadrcConfig
local M = {}


local VSCodeRunning = false
if vim.g.vscode then
  VSCodeRunning = true
else
  VSCodeRunning = false
end

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = true,
  -- changed_themes = {
  --   onedark = {
  --     base_16 = {
  --       base00 = "#282C34",
  --     },
  --     base_30 = {
  --       darker_black = "#21252B",
  --     },
  --   },
  -- },
  nvdash = {
    -- Check if vscode is running and if yes then don't fload the dashboard on startup
    load_on_startup = not VSCodeRunning,
    header = {
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
      "     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
      "     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
      "     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
    },
    -- basically what's in default_config.lua but no spaces between shortcut letters.
    buttons = {
      { "  Find File", "Spc ff", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc fo", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc fw", "Telescope live_grep" },
      { "  Bookmarks", "Spc ma", "Telescope marks" },
      { "  Themes", "Spc th", "Telescope themes" },
      { "  Mappings", "Spc ch", "NvCheatsheet" },
    },
  },
}

-- In order for react snippets to work in .js files I had to add change
-- .local/share/nvim/lazy/friendly-snippets/package.json file
-- and connect "react.json" to "javascript" files.

-- Set colons and brackets to grayish color (variables color)
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "variable" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "variable" })
vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "@variable" })
vim.api.nvim_set_hl(0, "@include", { link = "@keyword.return" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#e5c100" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#179FFF" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#0ac007" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#DA70D6" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#38dcdd" })

-- UFO arrows
vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#777777", bg = "NONE" })
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
