return {
	{
		"HiPhish/rainbow-delimiters.nvim",	
		lazy = false,

		dependencies = {'nvim-treesitter/nvim-treesitter'},

		config = function()
			require("rainbow-delimiters.setup").setup{
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
				    [''] = 110,
				    lua = 210,
				},
			}
		end,
	},
}
