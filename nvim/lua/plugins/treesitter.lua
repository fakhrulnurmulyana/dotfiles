return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		config = function()
			require('nvim-treesitter').install{
				"lua",
				"python",
				"rust",
				"c",
				"bash",
				"json",
				"markdown",
			}
		end,
	},
}
