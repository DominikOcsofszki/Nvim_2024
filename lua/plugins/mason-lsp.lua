local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    -- nmap("<leader>]", function() vim.diagnostic.goto_next() end, '[G]oto [D]iagnostics')
    -- nmap("<leader>[", function() vim.diagnostic.goto_prev() end, '[G]oto [D]iagnostics')
    nmap('<leader>gr', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ga', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('ga', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('<leader>gR', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>gh', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>g=', vim.lsp.buf.signature_help, 'Signature Documentation')

    vim.api.nvim_buf_create_user_command(bufnr, 'F', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end


return {
    {
        "neovim/nvim-lspconfig",
        dependencies =
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies =
            { "williamboman/mason.nvim" }
        },
        config = function()
            -- lspconfig.incc_lsp.setup{}
            require("mason").setup({ ensure_installed = { "lua_ls", "clangd", "clang-format", } })
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls",
                },
            })
            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        cmd = { "clangd", "--clang-tidy", "--fallback-style=Microsoft", "--completion-style=bundled" },
                        -- cmd={"clangd" ,"--clang-tidy", "--background-index", "--completion-style=bundled"},
                        capabilities = capabilities,
                        on_attach = on_attach,
                        -- settings = {
                        -- }
                    }
                end,
                ["ltex"] = function()
                    -- alternative: absolute path to file
                    -- local path_spelling = "/Users/NAME/.config/nvim/spell/spell-de.utf-8"
                    local path_spelling = vim.fn.stdpath("config") .. "/spell/spell-de.utf-8"
                    vim.keymap.set('n', '<leader>aw', ':!echo <c-r><c-w> >> /Users/dominikocsofszki/.config/nvim/spell/spell-de.utf-8', {})
                    local spell_de = {}
                    for word in io.open(path_spelling, "r"):lines() do
                        table.insert(spell_de, word)
                    end

                    local lspconfig = require("lspconfig")
                    lspconfig.ltex.setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            ltex = {
                                language = "de-DE",
                                dictionary = {
                                    ['de-DE'] = spell_de
                                }
                            },
                        },
                    }
                end,

            }
        end
    }
}
