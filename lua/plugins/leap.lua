return{
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings({})
			require('leap').opts.highlight_unlabeled_phase_one_targets=true
			-- require('leap').opts.safe_labels = {}
		end
	}

}
