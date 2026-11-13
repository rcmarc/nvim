vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		vim.diagnostic.config({
			virtual_text = true,
			float = { source = true },
		})
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = args.buf }
		if client and client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf)
			vim.keymap.set('i', '<c-space>', vim.lsp.completion.get, opts)
		end
		vim.keymap.set("n", "grq", vim.lsp.buf.format, opts)
	end
})

