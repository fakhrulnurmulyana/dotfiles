return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons'},

		config = function()
			require('lualine').setup{
				winbar = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'},
				},
				
				sections = {},

				inactive_sections = {},

				options = {
					theme = {
						normal = {
							a = { fg = "#1d2021", bg = "#83a598", gui = "bold" },
							b = { fg = "#ebdbb2", bg = "#3c3836" },
							c = { fg = "#ebdbb2", bg = "#282828" },
						},
					},
				},
			}
			vim.opt.laststatus=0
		end,
	},
}
