vim.api.nvim_create_autocmd('PackChanged', {
	desc = 'plugins setup',
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
			local ok, res = pcall(function() return vim.system({ 'make' }, { cwd = ev.data.path }):wait() end)
			if not ok or res.code ~= 0 then
				local reason = ok and res.stderr or res
				vim.notify(
					'telescope-fzf-native.nvim could not be compiled, reason: ' .. tostring(reason),
					vim.log.levels.ERROR
				)
			end
		end

		if name == 'nvim-treesitter' and kind == 'update' then
			if not ev.data.active then
				vim.cmd.packadd('nvim-treesitter')
			end
			vim.cmd('TSUpdate')
		end
	end,
})

vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/tpope/vim-fugitive',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
})

local telescope = require('telescope')
telescope.setup()
pcall(telescope.load_extension, 'fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files { hidden = true } end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- enable treesitter highlight for every installed parser
vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(ev.buf, lang)
		end
	end,
})
