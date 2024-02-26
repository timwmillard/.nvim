require("plugins")

vim.g.mapleader = " "

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

vim.o.colorcolumn = "81"

vim.o.swapfile = false
vim.o.backup = false

vim.o.clipboard = "unnamedplus"

vim.o.textwidth = 78

-- :noh no highlight
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>noh<CR>", { noremap = true })


vim.g.c_syntax_for_h = 1

vim.filetype.add({
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    env = "sh",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    [".env"] = "sh",
    ["env"] = "sh",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    -- INFO: Match filenames like - ".env.example", ".env.local" and so on
    ["%.env%.[%w_.-]+"] = "sh",
  },
})
