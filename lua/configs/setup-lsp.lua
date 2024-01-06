

vim.api.nvim_create_autocmd("FileType",{
    pattern = "lua",
    callback = function()
        vim.lsp.start({
            name = 'lua_ls',
            cmd = { "lua-language-server"},
            before_init = require("neodev.lsp").before_init,
            -- root_dir = vim.fs.dirname(vim.fs.find({'lazy-lock.json'},            { upward = true })[1]),
            root_dir = vim.fn.getcwd(),
            filetypes = { 'lua' },
            settings = {

                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },}
            })
            -- vim.lsp.buf_attach_client(0, client)
        end
    })

vim.api.nvim_create_autocmd("FileType",{
    pattern = "*",
    callback = function()
        local data = {
            buf = vim.fn.expand("<abuf>"),
            file = vim.fn.expand("<afile>"),
            match = vim.fn.expand("<amatch>"),
        }
        vim.schedule(function()
            -- print("inside autocmd")
            -- print(vim.inspect(data))
        end)
    end
})


         -- vim.lsp.start({ name = 'lua_ls', cmd = { "lua-language-server"}, before_init = require("neodev.lsp").before_init, root_dir = vim.fs.dirname(vim.fs.find({'lazy-lock.json'},            { upward = true })[1]), filetypes = { 'lua' },        })

-- settings = {
--
--                 diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--             },}
