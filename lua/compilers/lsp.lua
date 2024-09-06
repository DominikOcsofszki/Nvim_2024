-- Create an event handler for the FileType autocommand
-- vim.api.nvim_create_autocmd('FileType', {
--   -- This handler will fire when the buffer's 'filetype' is "python"
--   pattern = 'python',
--   callback = function(args)
--     vim.lsp.start({
--       name = 'incc-server',
--       cmd = {'python','/Users/dominikocsofszki/THESIS/dev/stdin/rpc/rpc.py'},
--       root_dir = vim.fs.root(args.buf, {'setup.py', 'pyproject.toml','input_log.txt'}),
--     })
--   end,
-- })

    -- vim.lsp.start({      cmd = {'python ~/THESIS/dev/stdin/rpc/rpc.py'} })
local configs = require 'lspconfig.configs'
local lspconfig = require("lspconfig")
-- Check if the config is already defined (useful when reloading this file)
-- if not configs.incc_server then
--  configs.incc_server = {
--    default_config = {
--      cmd = { "python3", "/Users/dominikocsofszki/THESIS/dev/stdin/rpc/rpc.py" },
--      -- cmd = { "node", "/Users/dominikocsofszki/MINE/lsp2/server/out/incc-lsp.js", "--stdio" },
--      filetypes = {'tx','inuc','incc','python','py','lua'},
--      single_file_support = true,
--      root_dir = function(fname)
--        return lspconfig.util.find_git_ancestor(fname)
--      end,
--      settings = {},
--    },
--  }
-- end

local util = require 'lspconfig.util'

if not configs.incc_server then
 configs.incc_server = {
  default_config = {
    cmd = { 'python3', '' },
    filetypes = { 'tx' },
    root_dir = util.root_pattern('package.json', '.git'),
    single_file_support = true,
    settings = {},
    init_options = {
      -- provideFormatter = true,
      -- embeddedLanguages = { css = true, javascript = true },
      -- configurationSection = { 'html', 'css', 'javascript' },
    },
  },
  docs = {
    description = [[
https://github.com/hrsh7th/vscode-langservers-extracted

`vscode-html-language-server` can be installed via `npm`:
```sh
npm i -g vscode-langservers-extracted
```

Neovim does not currently include built-in snippets. `vscode-html-language-server` only provides completions when snippet support is enabled.
To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.

The code-formatting feature of the lsp can be controlled with the `provideFormatter` option.

```lua
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
```
]],
  },
}
end
lspconfig.incc_server.setup{}

