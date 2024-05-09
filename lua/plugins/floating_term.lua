return{
    "numToStr/FTerm.nvim",
        config = function()
			-- require("FTerm").setup()
        	-- vim.cmd([[colorscheme kanagawa]])
            vim.keymap.set({'n','t'}, '<leader>;', '<CMD>lua require("FTerm").toggle()<CR>')
            vim.keymap.set({'n','t'}, '<leader><cr>', '<CMD>lua require("FTerm").toggle()<CR>')
            vim.keymap.set({'n','t'}, '<s-cr>', '<CMD>lua require("FTerm").toggle()<CR>')

        end
    }


