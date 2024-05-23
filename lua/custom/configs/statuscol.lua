local builtin = require "statuscol.builtin"
require("statuscol").setup {
  -- Ft ignore is for disabling statuscol indenting for certain filetypes (buffers, like terminal etc).
  -- It gets rid of the space between the buffer and the very left edge (foldcolumn = 0)
  -- Same filetypes should be disabled for ufo plugin too (ufo.lua file)
  -- You can get filetypes with vim.bo.filetype
  ft_ignore = { "nvcheatsheet", "NvimTree", "terminal", "nvdash", "Trouble" },
  -- setopt = true,
  relculright = true,
  segments = {

    -- A little space from the very left edge
    { text = { " " } },
    -- Diagnostics icons
    {
      sign = { name = { "Diagnostic" }, maxwidth = 1 },
      click = "v:lua.ScSa",
    },
    -- Line numbers
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    -- Chevrons
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    {
      sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
      click = "v:lua.ScSa",
    },
    -- A little space between folding chevrons and code!
    { text = { " " } },
  },
}
