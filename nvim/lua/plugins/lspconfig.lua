return {
	{
		'neovim/nvim-lspconfig',

		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
		},

		config = function()
			-- python 
			vim.lsp.enable('ruff')
			vim.lsp.enable('ty')
			-- rust
			vim.lsp.enable('rust_analyzer')
			-- C
			vim.lsp.enable('clangd')
			-- lua
			vim.lsp.enable('lua_ls')
			-- bash
			vim.lsp.enable('bashls')
		end,
	},
}
