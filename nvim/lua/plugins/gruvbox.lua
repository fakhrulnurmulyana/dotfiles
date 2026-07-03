return {
	{
		'datsfilipe/gruvbox.nvim',
		config = function()
			require('gruvbox').setup{
				transparent = true,
				italics = {
					comments = true,
					keywords = true,
					functions = false,
					strings = false,
					variables = false,
				},
				overrides = {}
			}
			vim.cmd.colorscheme('gruvbox')
		end,
	},
}
