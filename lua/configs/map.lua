vim.keymap.set('n', 'Y','"pyy"pp',{})
vim.keymap.set('n', '<Leader>e', ':e .<enter>',{})
vim.keymap.set('n', '<leader>jr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{})

-- yanking 
vim.keymap.set('n' ,'cw','"_ciw',{})
vim.keymap.set('n' ,'ciW','"_ciW',{})
vim.keymap.set('n' ,'ci','"_ci',{})
vim.keymap.set('n' ,'x','"_x',{})
vim.keymap.set('n', 'Y','"pyy"pp',{})
vim.keymap.set('n' ,'di}','"_di}',{})
vim.keymap.set('n','\\',':w<enter>',{})
vim.keymap.set('n','|',':q<enter>',{})

vim.keymap.set('n', '<leader><space>', '/', {})

vim.keymap.set('n', '<leader>oo', '<cmd>:NvimTreeFindFile<cr>', {desc = "<cmd>:NvimTreeFindFile<cr>"})

vim.keymap.set('n', '<C-s>', require('nvim-tree.api').tree.toggle, {desc = "Tree toggle"})


vim.keymap.set('n' ,'<leader>6' ,':ls<CR>:b<Space>',{})
