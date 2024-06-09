return {
	{
		'hrsh7th/nvim-cmp',
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			-- " For luasnip users.},
			-- { 'L3MON4D3/LuaSnip' },
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp"
			},
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'octaltree/cmp-look' }, --added be my

		},
		config = function()
			vim.diagnostic.config({
				-- virtual_text = false
			})
			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {})

			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),

				}),
				-- sources = cmp.config.sources({
				sources = cmp.config.sources({
					{ name = 'luasnip' },
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'buffer' },
                    {
                        name = 'look',
                        keyword_length = 2,
                        option = {
                            convert_case = true,
                            loud = true,
                            dict = '/Users/dominikocsofszki/.config/nvim/lua/dict'
                        }
                    },
				})
				-- 	{ name = 'nvim_lsp' },
				-- 	{ name = 'luasnip' }, -- For luasnip users.
				-- 	-- { name = 'nvim_lsp' },
				-- }, {
				-- 	{ name = 'buffer' },
				-- })
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
			-- Set up lspconfig.
			-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			-- require('lspconfig')['lua-language-server'].setup {
			-- -- require('lspconfig')['lua_lsp'].setup {
			-- 	capabilities = capabilities
			-- }

			-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
			--
			-- cmp.setup({
			-- 	sources = {
			-- 		{ name = 'path' },
			-- 		{ name = 'nvim_lsp' },
			-- 		{ name = 'nvim_lua' },
			-- 		{ name = 'luasnip', keyword_length = 2 },
			-- 		{ name = 'buffer',  keyword_length = 3 },
			-- 	},
			-- 	-- formatting = lsp_zero.cmp_format(),
			-- 	mapping = cmp.mapping.preset.insert({
			-- 		['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
			-- 		['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
			-- 		-- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
			-- 		['<C-Space>'] = cmp.mapping.complete(),
			-- 	}),
			-- })
		end


	}
}
-- local lsp_zero = require('lsp-zero')
-- lsp_zero.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--
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
-- end)
