local specs = {
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
}

vim.pack.add(specs, { confirm = false, load = true })

require("core.theme")
require("plugins.editor")
