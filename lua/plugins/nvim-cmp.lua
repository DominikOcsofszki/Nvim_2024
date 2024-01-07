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

	},
	config = function()
			local cmp = require 'cmp'

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
					}),
					-- sources = cmp.config.sources({
							sources = cmp.config.sources({
									{ name = 'luasnip'},
									{ name = 'path' },
									{ name = 'nvim_lsp' },
									{ name = 'nvim_lua' },
									{ name = 'buffer'  },
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
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			require('lspconfig')['lua_lsp'].setup {
				capabilities = capabilities
			}
		end


	}
}
