

vim.api.nvim_create_autocmd("FileType",{
    pattern = "lua",
    callback = function()
        local client = vim.lsp.start({ 
            name = 'lua_ls',
            cmd = { "lua-language-server"},
            root_dir = vim.fs.dirname(vim.fs.find({'lazy-lock.json'},
            { upward = true })[1]), 
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
