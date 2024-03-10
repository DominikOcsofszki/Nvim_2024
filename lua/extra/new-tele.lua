local pickers = require "telescope.pickers"
local finders = require "telescope.finders"

local sorters = require "telescope.sorters"


local opts = {


    layout_strategy = "vertical",
    layout_config = {
        height=10,
        width=0.3,
        prompt_position="top",
    },

    sorting_strategy="ascending",


    finder = finders.new_table {"gruvbox", "deus", "tokyonight"},
    sorter = sorters.get_generic_fuzzy_sorter({})

}

local colors = pickers.new(opts)

-- vim.print(colors)

local x = colors:find()
vim.print(x)
