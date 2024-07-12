vim.keymap.set('n','<leader>mt',':!npx tree-sitter parse   example-file.tx<cr>',{})
vim.keymap.set('n','<leader>mm',':e /Users/dominikocsofszki/Library/Application Support/tree-sitter/config.json',{})

vim.keymap.set('n','<leader>]',':lua require("compilers.treesitter_goto").do_sth()<cr>',{})


-- extra cmds:
vim.keymap.set('n','<leader>qf',':cf tmp/myqflist.x<cr>',{})
vim.keymap.set('n','<c-j>',':cn<cr>',{})
vim.keymap.set('n','<c-k>',':cp<cr>',{})
vim.keymap.set('n','<cr><cr>',':<up><cr>',{})

vim.api.nvim_create_user_command('QF', function()
    -- vim.cmd(':echo expand("%:.")')
    -- vim.cmd(':let @+ = expand("%:.")')
    vim.cmd(':cf tmp/myqflist.x')
end, {})

vim.keymap.set('n','<leader>cp','0yaboic<c-r>"<esc>',{})
vim.keymap.set('n','<leader>cp','0yiboic(">>>>",<c-r>")<esc>:w<cr>',{})
vim.keymap.set('n','<leader>cp','0yiboic(<c-r>")<esc>:w<cr>',{})

-- vim.keymap.set('n','<leader>r',':luafile /Users/dominikocsofszki/.config/nvim/lua/try_rand.lua<cr>',{})
