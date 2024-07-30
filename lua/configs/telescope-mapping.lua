
vim.keymap.set('n', '<leader>s/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
        .get_ivy {
        -- .get_dropdown {
                winblend = 40,
                previewer = true,
        })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>sh', function()
        require('telescope.builtin').help_tags({
                require('telescope.themes').get_dropdown {
                        previewer = true
                }
        })
end, { desc = 'Search [H]elp' })


vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current [W]ord' })
vim.keymap.set('n', '<leader>sl', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })

vim.keymap.set('n', '<leader>shh', '<cmd>Telescope find_files hidden=true<cr>', {})
vim.keymap.set('n', '<leader>shg', '<cmd>Telescope live_grep hidden=true<cr>', {})

-- vim.keymap.set('n', '<leader>sn', ":lua require('telescope.builtin').live_grep({cwd='utils.buffer_dir'})<CR>",{})
-- vim.keymap.set('n', '<leader>sn', "<cwd>lua require('telescope.builtin').live_grep({cwd='utils.buffer_dir'})",{})
vim.keymap.set('n', '<leader>slg', ":lua require('telescope.builtin').live_grep({glob_pattern='!.git'})<CR>" ,{ desc = 'live_grep not git' })
-- vim.keymap.set('n', '<leader>sng', ":Telescope live_grep glob_pattern=*.{json,vim,lua} additional_args={glob_pattern=*.lua" ,{})
vim.keymap.set('n', '<leader>slp', ":Telescope live_grep glob_pattern=" ,{})
vim.keymap.set('n', '<leader>slp', "Telescope live_grep glob_pattern=!.git" ,{})

vim.keymap.set('n', '<leader>w', ':Telescope file_browser path=%:p:h<enter><esc>', {})
-- vim.keymap.set('n', '<Leader>e', ':Telescope file_browser <enter>', {})
vim.keymap.set('n', '<leader>ss', ':Telescope <enter>', {})
vim.keymap.set('n', '<leader>so', ':Telescope oldfiles<enter>', {})
vim.keymap.set('n', '<leader>fn', ':Telescope find_files <enter>', {})
vim.keymap.set('n', '<leader>fg', ':Telescope find_files theme=get_cursor <enter>', {})
vim.keymap.set('n', '<leader>fi', ':Telescope find_files theme=get_ivy <enter>', {})
vim.keymap.set('n', '<leader>fc', ':Telescope find_files theme=get_dropdown <enter>', {})
vim.keymap.set('n', '<leader>sg', ':Telescope live_grep_args<cr>', {})

