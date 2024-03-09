return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()
			vim.keymap.set('n', '<Space>ja', ':lua require("harpoon.mark").add_file()<CR>', {})
			vim.keymap.set('n', '<Space>jj', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {})
			vim.keymap.set('n', '<Space>jn', ':lua require("harpoon.ui").nav_next()<CR>', {})
			vim.keymap.set('n', '<Space>jp', ':lua require("harpoon.ui").nav_prev()<CR>', {})
			vim.keymap.set('n', '<Space>j1', ':lua require("harpoon.ui").nav_file(1)<CR>')
			vim.keymap.set('n', '<Space>j2', ':lua require("harpoon.ui").nav_file(2)<CR>')
			vim.keymap.set('n', '<Space>j3', ':lua require("harpoon.ui").nav_file(3)<CR>')
			vim.keymap.set('n', '<Space>j4', ':lua require("harpoon.ui").nav_file(4)<CR>')
		end
	},
	-- niFiles.open(){
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {
	-- 		-- options
	-- 	},
	-- }
	--  {
	--   "folke/trouble.nvim",
	--   -- opts will be merged with the parent spec
	--   opts = { use_diagnostic_signs = true },
	-- },

	-- {"nvim-lualine/lualine.nvim"},



}
