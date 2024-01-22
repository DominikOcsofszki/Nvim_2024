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

--
-- vim.keymap.set('n', '<C-s>', require('nvim-tree.api').tree.toggle, {desc = "Tree toggle"})


-- vim.keymap.set('n', '<leader>6', ':ls<CR>:b<Space>', {})
vim.keymap.set('n', '<leader>w', ':Telescope file_browser path=%:p:h<enter><esc>', {})
vim.keymap.set('n', '<Leader>e', ':Telescope file_browser <enter>', {})
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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })


vim.keymap.set('n', '<C-j>', ':cn<cr>')
vim.keymap.set('n', '<C-k>', ':cp<cr>')
vim.keymap.set('n', '<tab><tab>', '<c-w>w')
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('i', 'kk', '<esc>')
vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<C-,>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<C-.>', ':vertical resize -5<CR>')

vim.keymap.set('n', '<leader>jt', ':Trouble <CR>', {})
-- vim.keymap.set('n', '<C-h>', '<C-w>h', {})
-- vim.keymap.set('n', '<C-l>', '<C-w>l', {})
-- vim.keymap.set('n', '<leader><C-o>',':lua vim.cmd( expand("%:p:h"))')
vim.keymap.set('n', '<leader><C-o>', ':cd %:p:h<CR>')
vim.keymap.set('n', '<leader><C-p>', ':cd! %:p:h<CR>')

vim.keymap.set('n', '<leader>oo', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<leader>gg',
        ":lua vim.ui.input({prompt = ' Grep > '}, function(value) require('telescope.builtin').grep_string({search = value}) end)<CR>")


vim.keymap.set('n', '<leader>oj',
':lua vim.lsp.buf.format {        filter = function(client) return client.name == "jdtls" end}')

	vim.api.nvim_exec([[
    augroup telescope
        autocmd!
        autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
    augroup END]], false)


vim.keymap.set('n', '<leader>gg',
        ":lua vim.ui.input({prompt = ' Grep > '}, function(value) require('telescope.builtin').live_grep({search = value}) end)<CR>")

vim.keymap.set('n', '<leader>ot', '<cmd>:NvimTreeFindFile<cr><C-w>T', {desc = "<cmd>:NvimTreeFindFile<cr>"})
vim.keymap.set('n', '<leader>1', ":!pwd|pbcopy<CR><C-\\><C-n>:cd <C-r>+<CR>")
-- vim.keymap.set('n', '<leader>0', ":!pwd|pbcopy<CR><C-\\><C-n>:cd <C-r>+<CR>:!export ")
vim.keymap.set('n', '<leader>oo', '<cmd>:NvimTreeFindFile<cr>', {desc = "<cmd>:NvimTreeFindFile<cr>"})
vim.keymap.set('n', '<leader>og', '<cmd>lua require"telescope".extensions.projects.projects{}<cr>', {desc = "open projects"})

vim.keymap.set('n', '<leader>t', ':tabnew %', {})
vim.keymap.set('t', '<backspace>', '<C-\\><C-n>', {})
