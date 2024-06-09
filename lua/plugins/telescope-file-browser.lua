return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            local fb_actions = require "telescope".extensions.file_browser.actions
            -- You don't need to set any of these options.
            -- IMPORTANT!: this is only a showcase of how you can set default options!
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        theme = "ivy",
                                    -- theme = 'dropdown',

                        -- disables netrw and use telescope-file-browser in its place
                        -- hijack_netrw = true,
                        depth = 'auto_depth',
                        -- grouped = true,
                        select_buffer = true,
                        -- auto_depth = true,

                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                ["h"] = fb_actions.goto_parent_dir,
                                -- ["l"] = fb_actions.enter,

                            },
                        },
                    },
                },
            }
            -- To get telescope-file-browser loaded and working with telescope,
            -- you need to call load_extension, somewhere after setup function:
            require("telescope").load_extension "file_browser"
        end
    }
}

-- - Default keymaps in insert/normal mode:
--   - `<cr>` : Opens the currently selected file/directory, or creates
--     whatever is in the prompt
--   - `<s-cr>` : Create path in prompt
--   - `/`, `\` : (OS Path separator) When typing filepath, the path separator
--     will open a directory like `<cr>`.
--   - `<A-c>/c`: Create file/folder at current `path` (trailing path
--     separator creates folder)
--   - `<A-r>/r`: Rename multi-selected files/folders
--   - `<A-m>/m`: Move multi-selected files/folders to current `path`
--   - `<A-y>/y`: Copy (multi-)selected files/folders to current `path`
--   - `<A-d>/d`: Delete (multi-)selected files/folders
--   - `<C-o>/o`: Open file/folder with default system application
--   - `<C-g>/g`: Go to parent directory
--   - `<C-e>/e`: Go to home directory
--   - `<C-w>/w`: Go to current working directory (cwd)
--   - `<C-t>/t`: Change nvim's cwd to selected folder/file(parent)
--   - `<C-f>/f`: Toggle between file and folder browser
--   - `<C-h>/h`: Toggle hidden files/folders
--   - `<C-s>/s`: Toggle all entries ignoring `./` and `../`
--   - `<bs>/` : Goes to parent dir if prompt is empty, otherwise acts
