vim.g.mapleader = " "

vim.opt.nu = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.exrc = true

vim.opt.signcolumn = 'yes'

vim.opt.undofile = true

vim.opt.winborder = 'rounded'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})

-- # mappings
vim.keymap.set({ 'i', 'n', 'v' }, '<C-C>', '<esc>', { desc = 'Make Ctrl+C behave exactly like escape.' })

-- ## clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

