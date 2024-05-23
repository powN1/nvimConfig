require("rainbow-delimiters.setup").setup {
  blacklist = { "html" },
  highlight = {
    -- 'RainbowDelimiterRed',
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    -- "RainbowDelimiterOrange",
    -- "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },
  query = {
    -- Only rainbow curly brackets (functions, objects) and not the html tags
    tsx = "rainbow-parens",
    javascript = "rainbow-parens",
  },
}
-- Make brackets colors vibrant
-- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#FFD700", blend = 20 })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#179FFF", blend = 20 })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#0CD608", blend = 20 })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#DA70D6", blend = 20 })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#3FF5F6", blend = 20 })
