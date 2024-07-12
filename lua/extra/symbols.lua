
-- builtin.treesitter()                          *telescope.builtin.treesitter()*
--     Lists function names, variables, and other symbols from treesitter queries
--     - Default keymaps:
--       - `<C-l>`: show autocompletion menu to prefilter your query by kind of ts
--         node you want to see (i.e. `:var:`)
--
--
--     Options: ~
--         {show_line}         (boolean)       if true, shows the row:column that
--                                             the result is found at (default:
--                                             true)
--         {bufnr}             (number)        specify the buffer number where
--                                             treesitter should run. (default:
--                                             current buffer)
--         {symbols}           (string|table)  filter results by symbol kind(s)
--         {ignore_symbols}    (string|table)  list of symbols to ignore
--         {symbol_highlights} (table)         string -> string. Matches symbol
--                                             with hl_group
--         {file_encoding}     (string)        file encoding for the previewer
--
vim.keymap.set('n',"<leader>;f",":lua require('telescope.builtin').treesitter({show_line=true,symbols='function'}) <cr>",{})
vim.keymap.set('n',"<leader>;v",":lua require('telescope.builtin').treesitter({show_line=true,symbols='var'}) <cr>",{})
vim.keymap.set('n',"<leader>;;",":lua require('telescope.builtin').treesitter({show_line=true}) <cr>",{})

