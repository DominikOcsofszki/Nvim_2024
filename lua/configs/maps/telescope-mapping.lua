
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>s?', require('telescope.builtin').oldfiles,{ desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>s/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
        .get_dropdown {
                winblend = 40,
                previewer = false,
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
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })

vim.keymap.set('n', '<leader>sth', '<cmd>Telescope find_files hidden=true<cr>', {})
vim.keymap.set('n', '<leader>stg', '<cmd>Telescope live_grep hidden=true<cr>', {})

-- vim.keymap.set('n', '<leader>sn', ":lua require('telescope.builtin').live_grep({cwd='utils.buffer_dir'})<CR>",{})
-- vim.keymap.set('n', '<leader>sn', "<cwd>lua require('telescope.builtin').live_grep({cwd='utils.buffer_dir'})",{})
vim.keymap.set('n', '<leader>slg', ":lua require('telescope.builtin').live_grep({glob_pattern='!.git'})<CR>" ,{ desc = 'live_grep not git' })
-- vim.keymap.set('n', '<leader>sng', ":Telescope live_grep glob_pattern=*.{json,vim,lua} additional_args={glob_pattern=*.lua" ,{})
vim.keymap.set('n', '<leader>slp', ":Telescope live_grep glob_pattern=" ,{})
vim.keymap.set('n', '<leader>slp', "Telescope live_grep glob_pattern=!.git" ,{})
