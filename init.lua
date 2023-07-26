require("plugins")

vim.g.mapleader = ","

-- Vim Set
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8

vim.o.updatetime = 50

vim.o.colorcolumn = "80"

vim.o.swapfile = false
vim.o.backup = false

vim.o.clipboard = "unnamedplus"

vim.o.textwidth = 78

-- :noh no highlight
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>noh<CR>", { noremap = true })

-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- vim.keymap.set('n', '<leader>bb', vim.cmd('NvimTreeToggle'), {})
-- nvim.keymap.set('n', '<leader>w', vim.api.nvim_set_current_win, {})


-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

-- Remap Enter key to insert a newline and stay in Normal mode
-- noremap <Enter> o<Esc>

