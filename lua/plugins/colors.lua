return {
    { "catppuccin/nvim",       name = "catppuccin" },
    { 'rose-pine/neovim',      name = 'rose-pine' },
    { "rebelot/kanagawa.nvim", name = 'kanagawa',  priority = 999 },
    { "sainnhe/sonokai" },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1001,
        config = function()
            require("cyberdream").setup({
                -- Recommended - see "Configuring" below for more config options
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
                terminal_colors = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim", name ="tokyonight",
        config = function()
            -- vim.cmd([[colorscheme catppuccin]])
            -- vim.cmd([[colorscheme rose-pine]])
            vim.cmd([[colorscheme kanagawa]])
            -- vim.cmd([[colorscheme tokyonight]])
            -- vim.cmd([[colorscheme cyberdream]])
        end,
    },

    -- vim.cmd([[colorscheme tokyonight]])


}

