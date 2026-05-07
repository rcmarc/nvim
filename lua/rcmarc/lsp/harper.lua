vim.lsp.config('harper_ls', {
	cmd = { 'harper-ls', '--stdio' },
	capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
	filetypes = { 'markdown', 'text', 'tex', 'typst' },
	root_markers = { '.git' },
})
vim.diagnostic.config({ virtual_lines = true })
vim.lsp.enable('harper_ls')
