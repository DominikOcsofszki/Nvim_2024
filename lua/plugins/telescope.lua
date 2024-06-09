return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim',     build = 'make' },
            { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
            {
                'nvim-telescope/telescope-media-files.nvim',
                dependencies = {
                    { 'nvim-lua/popup.nvim' },
                    { 'nvim-lua/plenary.nvim' },
                    { 'nvim-telescope/telescope.nvim' },
                    { 'nvim-telescope/telescope-media-files.nvim' },
                }
            }

        },
        opts = function()
            require('telescope').setup {
                extensions = {
                    media_files = {
                        -- filetypes whitelist
                        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                        filetypes = { "png", "webp", "jpg", "jpeg" },
                        -- find command (defaults to `fd`)
                        find_cmd = "rg"
                    }
                },

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
            require('telescope').load_extension('media_files')
        end
    },
}
