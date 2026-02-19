-- gruvbox theme for neovim
return {
	"motaz-shokry/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruvbox")
	end
}

