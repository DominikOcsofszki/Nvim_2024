
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
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	pattern = { "*.lua" },
-- 	command = "echo 'Entering a lua'",
-- })
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end
    -- edit new file
    -- bind('c', '%')
    -- rename file
    -- bind('r', 'R')
	bind('<Tab>','p')
	bind('<C-j>','jp')
	bind('<C-k>','kp')
	-- CursorMoved
	-- vim.api.nvim_create_autocmd('CursorMoved', {
	-- 		callback = function ()
	-- 			vim.fn.feedkeys("p")
	-- 		end
	-- }
	-- )
  end
})

