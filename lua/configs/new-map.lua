vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })


vim.keymap.set('n', '<leader>j1',':%!jq keys<cr>',{})
-- vim.keymap.set('n', '<leader>j1',':Redir :%!jq keys<cr>',{})
-- vim.keymap.set('n', '<leader>j2',':%!jq .',{})
-- vim.keymap.set('n', '<leader>j2','yi"u :%!jq .',{})
-- vim.keymap.set('n', '<leader>j2','yi"u :%!jq .<c-r>*<cr>',{})
vim.keymap.set('n', '<leader>j2','yi"u :%!jq .<c-r>*<cr>',{})
vim.keymap.set('n', '<leader>j3','yyu :%!jq .<c-r>*',{})

