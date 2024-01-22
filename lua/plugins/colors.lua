return {
    { "catppuccin/nvim",       name = "catppuccin" },
    { 'rose-pine/neovim',      name = 'rose-pine' },
    { "rebelot/kanagawa.nvim", name = 'kanagawa',  priority = 1000 },
    { "sainnhe/sonokai" },
    {
        "folke/tokyonight.nvim", name ="tokyonight",
        config = function()
        	-- vim.cmd([[colorscheme catppuccin]])
        	-- vim.cmd([[colorscheme rose-pine]])
        	vim.cmd([[colorscheme kanagawa]])
        	-- vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- vim.cmd([[colorscheme tokyonight]])

}
