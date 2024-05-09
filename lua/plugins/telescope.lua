return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        opts = function()
            require('telescope').setup {
                pickers = {
                    live_grep = {
                        -- additional_args = function()
                        --     return { "--hidden" }
                        -- end
                    },
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-CR>"] = "send_selected_to_qflist"
                        },
                        n = {
                            ["<C-CR>"] = "send_selected_to_qflist"
                        }
                    }
                },
            }

            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')
            require("telescope").load_extension("live_grep_args")
            -- require('telescope').load_extension('projects')
            -- require("telescope").load_extension("fzf")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            -- require("telescope").load_extension("")
            --
            -- -- See `:help telescope.builtin`
            -- vim.keymap.set('n', '<leader>s?', require('telescope.builtin').oldfiles,{ desc = '[?] Find recently opened files' })
            -- vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
            -- vim.keymap.set('n', '<leader>s/', function()
            --         -- You can pass additional configuration to telescope to change theme, layout, etc.
            --         require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes')
            --         .get_dropdown {
            --                 winblend = 40,
            --                 previewer = false,
            --         })
            -- end, { desc = '[/] Fuzzily search in current buffer' })
            --
            -- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
            -- -- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
            -- vim.keymap.set('n', '<leader>sh', function()
            --         require('telescope.builtin').help_tags({
            --
            --                 require('telescope.themes').get_dropdown {
            --                         previewer = true
            --                 }
            --         })
            -- end, { desc = 'Search [H]elp' })
            -- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
            -- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })
            --
            -- vim.keymap.set('n', '<leader>sth', '<cmd>Telescope find_files hidden=true<cr>', {})
            -- vim.keymap.set('n', '<leader>stg', '<cmd>Telescope live_grep hidden=true<cr>', {})
        end
    },
    -- 'nvim-telescope/telescope-fzf-native.nvim',
}
