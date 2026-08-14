vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" then
			vim.system({ "make" }, { cwd = ev.data.path }) -- Run build inside plugin folder
		end

		if ev.data.spec.name == "nvim-treesitter" then
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/folke/tokyonight.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/tpope/vim-fugitive',
})
