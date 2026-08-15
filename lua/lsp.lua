vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method('textDocument/completion') then
			-- Enable completion and set autotrigger to true for automatic popup
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			vim.keymap.set('i', '<c-space>', function()
				vim.lsp.completion.get()
			end)
		end
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "<leader>gq", function() vim.lsp.buf.format() end, opts)
		vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>gh", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>gf", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "<leader>gca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<leader>gt", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "<leader>]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
		vim.keymap.set("n", "<leader>[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
	end
})

-- Lua

vim.lsp.config('lua_ls', {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath('config')
				and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library'
					-- '${3rd}/busted/library'
				}
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			}
		})
	end,
	settings = {
		Lua = {}
	}
})
vim.lsp.enable('lua_ls')

-- Web
vim.lsp.enable('tsc')
vim.lsp.enable('oxlint')
vim.lsp.enable('oxfmt')
vim.lsp.enable('eslint')
vim.lsp.enable('jsonls')
local htmlcss_capabilities = vim.lsp.protocol.make_client_capabilities()
htmlcss_capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('html', {
	capabilities = htmlcss_capabilities,
})
vim.lsp.enable('html')
vim.lsp.config('cssls', {
	capabilities = htmlcss_capabilities,
})
vim.lsp.enable('cssls')


-- Others
vim.lsp.enable('clangd')
