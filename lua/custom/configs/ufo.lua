local handler = function(virtText, lnum, endLnum, width, truncate)
  -- Custom icons after folding the block
  local newVirtText = {}
  local suffix = ("... 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

-- Ufo keymaps had to be put here cuz if it's in custom/mappings.lua then for some reason
-- it doesn't override the default keymapping (zR, zM)
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
require("ufo").setup {
  fold_virt_text_handler = handler,
  -- Treesitter as provider disabled. The main provider is the lsp because it lets you
  -- fold arrays/lists and with treesitter it doesn't

  -- provider_selector = function(bufnr, filetype, buftype)
  --   return { "treesitter", "indent" }
  -- end,
}

-- A function to disable ufo indenting for certain filetypes (buffers, like terminal etc).
-- It gets rid of the space between the buffer and the very left edge (foldcolumn = 0)
-- Same filetypes should be disabled for statuscol plugin too (statuscol.lua file)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nvcheatsheet", "NvimTree", "terminal", "nvdash", "Trouble" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
    vim.wo.foldcolumn = "0"
  end,
})
