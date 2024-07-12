return {
  -- amongst your other plugins
  {'akinsho/toggleterm.nvim', version = "*", config = function ()
    require("toggleterm").setup()
    vim.keymap.set('n', "``", ':ToggleTerm<cr>i<up><cr>',{})
    vim.keymap.set('t', "``", '<c-\\><c-n>:ToggleTerm<cr>',{})
  end}
  -- or
}
