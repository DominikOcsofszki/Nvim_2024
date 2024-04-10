return{
    "numToStr/FTerm.nvim",
        config = function()
			-- require("FTerm").setup()
        	-- vim.cmd([[colorscheme kanagawa]])
            vim.keymap.set({'n','t'}, '<leader>;', '<CMD>lua require("FTerm").toggle()<CR>')

        end
    }


