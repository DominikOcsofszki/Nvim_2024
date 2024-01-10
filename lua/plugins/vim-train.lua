return {
	-- lazy.nvim
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {}
	},
	{
		"tris203/hawtkeys.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = {
			-- an empty table will work for default config
			--- if you use functions, or whichky, or lazy to map keys
			--- then please see the API below for options
		},
	},
}
