return {


    {     -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                tree_docs = {enable = true},

                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = "all",
                -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024                         -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
            }
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },

}
            -- require('telescope').setup {
            --     defaults = {
            --         file_sorter = require 'telescope.sorters'.get_fzy_sorter,
            --         generic_sorter = require 'telescope.sorters'.get_fzy_sorter,
            --     }
            -- }

