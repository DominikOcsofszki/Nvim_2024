--
-- vim.api.nvim_create_autocmd('filetype', {
--   pattern = {'tx','inuc','incc'},
--   desc = 'commands for tx',
--   callback = function()
--     vim.cmd('setfiletype incc')
--     vim.cmd('set cms=#%s')
--   end
-- })
vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, {
  pattern = {'*.incc','*.tx','*.inuc'},
  -- desc = 'commands for tx',
  callback = function()
    vim.cmd('setfiletype tx')
    vim.cmd('set cms=#%s')
  end
})
--
local configs = require 'lspconfig.configs'
local lspconfig = require("lspconfig")
-- Check if the config is already defined (useful when reloading this file)
if not configs.incc_lsp then
 configs.incc_lsp = {
   default_config = {
     -- cmd = { "node", "/Users/dominikocsofszki/ws24/incc_lsp/server/out/server.js", "--stdio" },
     cmd = { "node", "/Users/dominikocsofszki/MINE/lsp2/server/out/incc-lsp.js", "--stdio" },
     -- cmd = { "node", "/Users/dominikocsofszki/MINE/Lsp/server/out/server.js", "--stdio" },
     -- cmd = { "node", "/Users/dominikocsofszki/MINE/lsp2/server/out/server.js", "--stdio" },
     filetypes = {'tx','inuc','incc'},
     root_dir = function(fname)
       return lspconfig.util.find_git_ancestor(fname)
     end,
     settings = {},
   },
 }
end

lspconfig.incc_lsp.setup{}

        -- vim.filetype.add({
        --   extension = {
        --     incc = {'incc','inuc','tx'},
        --   },
        --   -- filename = {
        --   --   ['.foorc'] = 'toml',
        --   --   ['/etc/foo/config'] = 'toml',
        --   -- },
        --   -- pattern = {
        --   --   ['.*&zwj;/etc/foo/.*'] = 'fooscript',
        --   --   -- Using an optional priority
        --   --   ['.*&zwj;/etc/foo/.*%.conf'] = { 'dosini', { priority = 10 } },
        --   --   -- A pattern containing an environment variable
        --   --   ['${XDG_CONFIG_HOME}/foo/git'] = 'git',
        --   --   ['README.(%a+)$'] = function(path, bufnr, ext)
        --   --     if ext == 'md' then
        --   --       return 'markdown'
        --   --     elseif ext == 'rst' then
        --   --       return 'rst'
        --   --     end
        --   --   end,
        --   -- },
        -- })

