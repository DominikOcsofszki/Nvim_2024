
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open })
-- vim.api.nvim_create_autocmd({ "BufEnter" }, { callback =  })
