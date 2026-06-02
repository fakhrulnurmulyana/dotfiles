return{
	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup{
				numhl = false,
				signcolumn = true,
			}
		end,
	},
}
