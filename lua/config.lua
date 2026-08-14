vim.g.mapleader = " "

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.scrolloff = 8

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }

vim.cmd [[ colorscheme tokyonight-night ]]

-- transparent background
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- # mappings

vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- ## clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

-- ## toggle word wrap
vim.keymap.set('n', '<leader>wr', ':set wrap!<CR>', { silent = true, desc = 'Toggle Wrap' })

-- ## telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files { hidden = true } end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
