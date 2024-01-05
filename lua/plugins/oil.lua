
return {
    'stevearc/oil.nvim',
    opts = {
        function()
            require("oil").setup()
            require("plugins.plugconfs.mapping-plug")
        end
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    key = {
        {vim.keymap.set('n', '<Leader>oe', ':Oil <enter>',{})}

    }
}
