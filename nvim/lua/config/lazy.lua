local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN]  = "󰀪",
			[vim.diagnostic.severity.INFO]  = "󰋽",
			[vim.diagnostic.severity.HINT]  = "󰌶",
		},
	},
})

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
