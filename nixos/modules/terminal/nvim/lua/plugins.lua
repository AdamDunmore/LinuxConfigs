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
    { --Comments
        'terrortylor/nvim-comment'
    },

    {  --Treesitter
        'nvim-treesitter/nvim-treesitter'
    },

    { --Status Bar
        'freddiehaddad/feline.nvim'
    },

    { --Theme
        'catppuccin/nvim',
        name = "catppuccin",
        priority = 1000
    },

    { -- ToggleTerm
        'akinsho/toggleterm.nvim'
    },

    { --Autoclose
        'm4xshen/autoclose.nvim'
    },

    { --UI Component Library

        'MunifTanjim/nui.nvim'
    },

    { --Telescope
        	'nvim-telescope/telescope.nvim',
        	dependencies = {
                'nvim-lua/plenary.nvim'
            }
	},

    { --Telescope Projects
        'nvim-telescope/telescope-project.nvim'
    },

    { --Telescope File Browser
        'nvim-telescope/telescope-file-browser.nvim'
    },

    { --Dashboard
        'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		dependencies = {'nvim-tree/nvim-web-devicons'}
	},

    { --LSP
        'dundalek/lazy-lsp.nvim',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'VonHeikemen/lsp-zero.nvim'},
            {'L3MON4D3/LuaSnip'},
        }
    }
}


require("lazy").setup(plugins, opts)

-- Small options
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
require("/plugins/comments")
require("/plugins/toggleterm")
