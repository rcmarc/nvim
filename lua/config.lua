vim.g.mapleader = " "

vim.opt.nu = true

vim.opt.scrolloff = 8

vim.opt.incsearch = true

vim.opt.colorcolumn = "80"

vim.opt.spell = true
vim.opt.spelllang = "en"

vim.opt.exrc = true

-- # mappings
vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- ## clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

-- ## telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files { hidden = true } end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
