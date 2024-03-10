
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
-- vim.api.nvim_create_autocmd('filetype', {
--   -- pattern = 'netrw',
--   pattern = {'NvimTree'},
--   desc = 'Better mappings for NvimTree',
--   callback = function()
--     local bind = function(lhs, rhs)
--       vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
--     end
-- 	-- bind('<Tab>','p')
--
--     -- vim.keymap.set('n', '<s-tab>', '<c-w>w')
-- -- vim.keymap.set( 'n', '<C-k>', '<Nop>', { silent = true, buffer = true })
-- 	-- bind('<C-j>','j<Tab>')
-- 	-- bind('J','j<Tab>')
-- 	-- bind('K','k<Tab>')
-- 	-- bind('<C-j>','jp')
--   end
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    command = "normal! g'\"zz"
})

vim.api.nvim_create_user_command('CopyPath', function()
    vim.cmd(':let @+ = expand("%")')
end, {})
