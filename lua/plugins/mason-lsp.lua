
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    --   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    --   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    --   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    --   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    nmap("<leader>]", function() vim.diagnostic.goto_next() end, '[G]oto [D]iagnostics')
    nmap("<leader>[", function() vim.diagnostic.goto_prev() end, '[G]oto [D]iagnostics')

    nmap('<leader>gr', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ga', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('<leader>gR', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>gD', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    --
    -- -- See `:help K` for why this keymap
    nmap('<leader>gh', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>g=', vim.lsp.buf.signature_help, 'Signature Documentation')
    --
    -- -- Lesser used LSP functionality
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
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
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls",
                    -- "eslint-lsp",
                    -- "js-debug-adapter",
                    -- "prettier",
                    -- "typescript-language-server"
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
                        -- settings = servers[server_name],
                    }

                    -- require("lspconfig")[server_name].setup {}
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
            }
        end
    }
}
