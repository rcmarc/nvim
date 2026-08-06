vim.lsp.config('zubanls', {
	name = "ZubanLS",
	cmd = { "zuban", "server" },
	root_markers = { "pyproject.toml", ".git" },
	filetypes = { "python" },
})

vim.lsp.enable("zubanls")

vim.lsp.config('ruff', {
	init_options = {
		settings = {
			-- Ruff language server settings go here
		}
	}
})

vim.lsp.enable('ruff')
