
return {
    {'williamboman/mason.nvim', config = function() require('mason').setup({}) end},
    -- {'williamboman/mason-lspconfig.nvim', config = function() require('mason-lspconfig').setup({}) end},
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "angularls",
                    "bashls",
                    "cssls",
                    "eslint",
                    -- "gopls",
                    "html",
                    "jsonls",
                    "lua_ls",
                    -- "rust_analyzer",
                    -- "svelte",
                    -- "tailwindcss",
                    "tsserver",
                    "yamlls",
                },
            })
        end,
    },
}
