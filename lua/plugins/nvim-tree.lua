return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = function()
      require("nvim-tree").setup()
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  }




}
