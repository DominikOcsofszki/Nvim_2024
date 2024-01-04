return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = function()
      require("nvim-tree").setup()
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require("nvim-tree.api").tree.open })
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },




}
