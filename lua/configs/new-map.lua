vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })


vim.keymap.set('n', '<leader>j1',':%!jq keys<cr>',{})
vim.keymap.set('n', '<leader>j2','yi"u :%!jq .<c-r>*<cr>',{})
vim.keymap.set('n', '<leader>j3','yyu :%!jq .<c-r>*',{})

-- jq -r 'paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")' json_example.json
vim.keymap.set('n', '<leader>j3','yyu :%!jq .<c-r>*',{})


-- ='jq -r \'paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")\' json_example.json'
-- alias jgf='jq -r \'paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")\' json_example.json'


-- cat json_example.json |jq $(jq -r 'paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")' json_example.json | fzf)

-- cat json_example.json |jq $(jq -r 'paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")' json_example.json | fzf)

-- alias show_keys='jq -r '\''paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")'\'''
-- alias show_jq='jq $(show_keys)'
-- vim.keymap.set('n', ',j', function()
--     vim.cmd('jq -r '\''paths(scalars) | map(if type == "number" then "[\(. | tostring)]" else "." + tostring end) | join("")'\''')
--     end,
--     {})

vim.keymap.set('n', '<leader><space>',':find',{})
-- vim.keymap.set('n', '',':let @+ = expand("%")',{})

