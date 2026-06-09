vim.lsp.config('harper_ls', {
	cmd = { 'harper-ls', '--stdio' },
	capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
	filetypes = { 'markdown', 'text', 'tex', 'typst' },
	root_markers = { '.git' },
})
vim.lsp.enable('harper_ls')
