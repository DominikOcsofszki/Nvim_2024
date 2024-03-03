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
