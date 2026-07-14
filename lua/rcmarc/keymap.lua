vim.g.mapleader = " "

vim.keymap.set({'i', 'n', 'v'}, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- clipboard
vim.keymap.set({'n', 'v'}, '<leader>y','"+y')
vim.keymap.set({'n', 'v'}, '<leader>p','"+p')

-- toggle word wrap
vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>', { silent = true, desc = 'Toggle Wrap' })

