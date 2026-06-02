vim.g.mapleader = " "

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.api.nvim_create_user_command(
	"E",
	function(opts) 
		vim.cmd("edit %/" .. opts.args) 
	end,
	{ nargs = 1 }
)
