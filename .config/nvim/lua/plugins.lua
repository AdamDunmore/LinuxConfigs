-- Initital Setup
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

-- Plugin List
local plugins = {
    {'nvim-treesitter/nvim-treesitter'}, --Treesitter
	{'freddiehaddad/feline.nvim'}, --Status Bar
    {'catppuccin/nvim', name = "catppuccin", priority = 1000}, --Theme
    {'https://github.com/m4xshen/autoclose.nvim'}, --Autoclose
    {'https://github.com/MunifTanjim/nui.nvim'}, --UI Component Library
	{ --Telescope
        	'https://github.com/nvim-telescope/telescope.nvim', 
        	dependencies = {{'https://github.com/nvim-lua/plenary.nvim'}}
	},
    {'https://github.com/nvim-telescope/telescope-project.nvim'}, --Telescope Projects
    {'https://github.com/nvim-telescope/telescope-file-browser.nvim'},

    { --Dashboard
        'https://github.com/nvimdev/dashboard-nvim',
		event = 'VimEnter',
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},

	--Language Server (Zero LSP)
	{
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
                    --LSP Deps
                    {'neovim/nvim-lspconfig'},
                    {'hrsh7th/nvim-cmp'},
                    {'hrsh7th/cmp-nvim-lsp'},
                    {'L3MON4D3/LuaSnip'},
        }
	},

    {
        'dundalek/lazy-lsp.nvim',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'VonHeikemen/lsp-zero.nvim'},
        }
    }
}

require("lazy").setup(plugins, opts)

--require("lazy-lsp").setup {}

-- Sets colour scheme
vim.cmd.colorscheme "catppuccin"

require('autoclose').setup()

-- configs
--require("/plugins/lspzero")
require("/plugins/lazy-lsp")
require("/plugins/telescope")
require("/plugins/feline")
require("/plugins/dashboard")
require("/plugins/treesitter")
require("/plugins/keymap_help")
