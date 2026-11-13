vim.g.mapleader = " "

vim.opt.nu = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.spell = true
vim.opt.spelllang = "en"

vim.opt.exrc = true

vim.opt.signcolumn = 'yes'

vim.opt.undofile = true

vim.opt.winborder = 'rounded'

-- # mappings
vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- ## clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
