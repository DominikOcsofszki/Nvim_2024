
vim.o.termguicolors = true
vim.o.number = true
vim.o.hlsearch = true
-- vim.o.mouse = "a"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = "yes"
vim.o.hlsearch = false
vim.o.breakindent = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,preview,popup'
vim.o.so = 15
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true


vim.o.swapfile           = false

vim.o.splitbelow         = true
vim.o.splitright         = true
vim.o.title              = true
vim.g.netrw_banner       = 0
-- vim.opt.path = vim.opt.path + "**"
vim.opt.path:append '**'
-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.tw=100

-- SETUP ZSH FROM PROFILE:
vim.opt.shell="/bin/zsh -l"

