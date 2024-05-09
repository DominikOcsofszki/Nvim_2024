
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
  pattern = {'qf'},
  desc = 'Better mappings for NvimTree',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end
    bind('q',':q<cr>')
  end
})
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    command = "normal! g'\"zz"
})

vim.api.nvim_create_user_command('CopyPath', function()
    vim.cmd(':let @+ = expand("%")')
end, {})
vim.api.nvim_create_user_command('CopyFullPath', function()
    vim.cmd(':let @+ = expand("%:p")')
end, {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern={'*.cpp','*.hpp','*.tex'},
    callback = function()
        vim.cmd('F')
	end,
})

