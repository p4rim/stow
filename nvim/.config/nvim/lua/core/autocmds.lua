vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Use Vim syntax highlighting, including for filetypes whose ftplugin starts Tree-sitter.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		if vim.treesitter.highlighter.active[event.buf] then
			vim.treesitter.stop(event.buf)
		end
	end,
})
