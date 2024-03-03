return{
    "numToStr/FTerm.nvim",
        config = function()
			-- require("FTerm").setup()
        	-- vim.cmd([[colorscheme kanagawa]])
            vim.keymap.set('n', ',;', '<CMD>lua require("FTerm").toggle()<CR>')

        end
    }


