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

vim.keymap.set('n', '<leader><space>','/',{})
vim.keymap.set('n', ';;','<c-w>w',{})
vim.keymap.set('n', '<leader><leader>','<c-w>w',{})
-- vim.keymap.set('n', '',':let @+ = expand("%")',{})


vim.keymap.set('n','<leader>r',':!python3 %<cr>',{})
vim.keymap.set('n','<leader>r',':w<cr>:!python3 %<cr>',{})
-- /Users/dominikocsofszki/Dev/nvim/nvim-macos/share/nvim/runtime/keymap/german-new.vim
vim.keymap.set('n','<leader>ge',':set kmp=german-new<cr>',{})

-- local path_de = "/Users/dominikocsofszki/.config/nvim/spell/spell-de.utf-8"
-- vim.keymap.set('n','<leader>aw',':!echo <c-r><c-w> >> /Users/name/.config/nvim/spell/spell-de.utf-8',{})



vim.keymap.set('n','<c-h>','<c-w>h',{})
vim.keymap.set('n','<c-l>','<c-w>l',{})
vim.keymap.set('n','<c-j>','<c-w>j',{})
vim.keymap.set('n','<c-k>','<c-w>k',{})


-- vim.keymap.set('n','<leader>fff',':Telescope live_grep_args<cr><c-r><c-w><cr> ',{})

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set({"n","v"}, "<leader>f", live_grep_args_shortcuts.grep_word_under_cursor)
-- vim.keymap.set("n", "<leader>f", live_grep_args_shortcuts.vim)

vim.keymap.set("n","qq",":q<cr>",{})

