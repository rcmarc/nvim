vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/tpope/vim-fugitive',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
})

-- enable treesitter highlight for every installed parser
vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(ev.buf, lang)
		end
	end,
})
