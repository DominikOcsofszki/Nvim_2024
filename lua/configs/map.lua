vim.keymap.set('n', 'Y', '"pyy"pp', {})
-- vim.keymap.set('n', '<Leader>e', ':e .<enter>',{})
vim.keymap.set('n', '<leader>jr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- yanking
vim.keymap.set('n', 'cw', '"_ciw', {})
vim.keymap.set('n', 'ciW', '"_ciW', {})
vim.keymap.set('n', 'ci', '"_ci', {})
vim.keymap.set('n', 'x', '"_x', {})
vim.keymap.set('n', 'Y', '"pyy"pp', {})
vim.keymap.set('n', 'di}', '"_di}', {})
vim.keymap.set('n', '\\', ':w<enter>', {})
vim.keymap.set('n', '|', ':q<enter>', {})

vim.keymap.set('n', '<leader><space>', '/', {})
vim.keymap.set('v', '<leader><space>', '/', {})

-- vim.keymap.set('n', '<leader>oo', '<cmd>:NvimTreeFindFile<cr>', {desc = "<cmd>:NvimTreeFindFile<cr>"})
--
-- vim.keymap.set('n', '<C-s>', require('nvim-tree.api').tree.toggle, {desc = "Tree toggle"})


-- vim.keymap.set('n', '<leader>6', ':ls<CR>:b<Space>', {})
vim.keymap.set('n', '<leader>w', ':Telescope file_browser path=%:p:h<enter><esc>', {})
vim.keymap.set('n', '<Leader>e', ':Telescope file_browser <enter><esc>', {})
vim.keymap.set('n', '<leader>ss', ':Telescope <enter>', {})
vim.keymap.set('n', '<leader>so', ':Telescope oldfiles<enter>', {})
-- vim.keymap.set('n' ,'<leader>f' ,':Telescope find_files <enter><esc>',{})
vim.keymap.set('n', '<leader>f', ':Telescope find_files <enter>', {})

-- vim.keymap.set('n', 'm', ':', {})
-- vim.keymap.set('n','<leader>a',require('telescope.builtin').oldfiles,{})

-- vim.keymap.set('n', '<leader>a', function()
-- 	require('telescope.builtin').lsp_definitions
-- end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>=', 'gg gqG', {})
vim.keymap.set('n', '<leader>=', 'ml gg gqG `l', {})
vim.keymap.set('n', '<leader>]', ':bnext<enter>', {})
vim.keymap.set('n', '<leader>[', ':bprev<enter>', {})

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

