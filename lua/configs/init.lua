require("configs.map")
require("configs.set")
require("configs.autocmd")
require("configs.telescope-mapping")
require("configs.new-map")
require("try")
-- require("configs.switcher_compiler")
vim.keymap.set({"n","v"}, "<leader>f", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor)

