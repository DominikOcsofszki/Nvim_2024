return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    { 'numToStr/Comment.nvim', opts = {} },

    { "folke/neodev.nvim",     opts = {} }
}
--     , opts = {},
--     config = function()
--         before_init=require("neodev.lsp").before_init
--                 require("neodev").setup({
--                     lspconfig = true,
-- })
--                 end
--             }
