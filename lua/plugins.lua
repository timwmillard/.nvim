
-- Lazy 
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
    -- "folke/which-key.nvim",
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    -- "folke/neodev.nvim",
    --
    -- Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Nvim Tree
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- File Search Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Git Diff
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
})

