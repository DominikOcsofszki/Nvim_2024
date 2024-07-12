

M = {}

    vim.b[0].server_call = vim.lsp.get_clients()[1].server_capabilities
    local sc = vim.lsp.get_clients()[1].server_capabilities
    -- vim.print(vim.b[0].server_call)
    vim.print(sc)


return M
