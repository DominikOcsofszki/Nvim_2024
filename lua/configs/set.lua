
vim.o.termguicolors = true
vim.o.number = true
vim.o.hlsearch = true
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn ="yes"
vim.o.hlsearch = false
vim.o.breakindent = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- vim.o.completeopt = 'menuone,preview'
-- vim.o.completeopt = 'menuone,noselect'
vim.o.so = 15
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open() })
