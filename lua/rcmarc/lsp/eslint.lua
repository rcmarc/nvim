vim.lsp.config('eslint', {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro", "htmlangular", "css", "scss", "less" }
})

vim.lsp.enable('eslint')
