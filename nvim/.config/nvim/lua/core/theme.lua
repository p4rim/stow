vim.opt.termguicolors = true

vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})

require("rose-pine").setup({
	variant = "main",

	palette = {
		main = {
			base = "#000000",
			surface = "#000000",
			overlay = "#000000",
		},
	},

	highlight_groups = {
		Normal = { bg = "#000000" },
		NormalNC = { bg = "#000000" },
		NormalFloat = { bg = "#000000" },
		FloatBorder = { bg = "#000000" },
		SignColumn = { bg = "#000000" },
		LineNr = { bg = "#000000" },
		CursorLine = { bg = "#000000" },
		StatusLine = { bg = "#000000" },
		Pmenu = { bg = "#000000" },
		EndOfBuffer = { bg = "#000000" },
	},
})

vim.cmd.colorscheme("rose-pine")
