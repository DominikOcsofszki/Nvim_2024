
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
            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
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