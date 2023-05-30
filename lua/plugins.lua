-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File Explorer
  use {
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    		'nvim-tree/nvim-web-devicons', -- optional
  	},
  	config = function()
    		require("nvim-tree").setup {}
  	end
  }

  -- File Search Fuzzy Finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  vim.cmd.colorscheme "catppuccin"

  -- use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- vim.cmd('colorscheme rose-pine')

  -- Lualine
   use {
	  'nvim-lualine/lualine.nvim',
 	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   }

 use 'tpope/vim-fugitive'

  -- Git Diff
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Git Signs
  use {
  	'lewis6991/gitsigns.nvim',
  	-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  -- Syntax Highlighting
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- LSP Package Manager
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  -- use 'neovim/nvim-lspconfig'

  -- use 'fatih/vim-go'

end)

