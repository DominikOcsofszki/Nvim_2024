
-- vim.filetype.add({
--   extension = {
--       incc = 'incc'
--   },
-- })
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tx = {
  install_info = {
    url = "/Users/dominikocsofszki/ss2024/tree-sitter/tree-sitter-tx", -- local path or git repo
    -- url = "/Users/dominikocsofszki/.config/nvim/lua/compilers/tree-sitter-tx/tx.dylib", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    -- branch = "main", -- default branch in case of git repo if different from master
    -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = {"tx","incc"}, -- if filetype does not match the parser name
}

-- helper if needed:
--  local bind = function(lhs, rhs)
--   vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
-- end
-- bind('q',':q<cr>')
