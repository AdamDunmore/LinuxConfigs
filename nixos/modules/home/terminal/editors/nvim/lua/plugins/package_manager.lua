local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    });
end
vim.opt.rtp:prepend(lazypath);

plugins = {    
    -- NAVIGATION --
    { -- Telescope
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    }, 

    { -- Telescope Project
        "nvim-telescope/telescope-project.nvim"
    },

    { -- Telescope File Browser
        "nvim-telescope/telescope-file-browser.nvim"
    },

    -- UI --
    { -- NUI
        "MunifTanjim/nui.nvim"
    },

    { -- Theme
        "shaunsingh/nord.nvim"
    },

    { -- Bufferline
        "akinsho/bufferline.nvim",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    { -- Dashboard
        "nvimdev/dashboard-nvim"
    },

    {
        "nvim-tree/nvim-tree.lua"
    },

    -- Code
    { --Treesitter
        "nvim-treesitter/nvim-treesitter"
    },

    { -- Nvim-Cmp
        "hrsh7th/nvim-cmp"
    },

    { -- Luasnip
        "l3mOn4d3/luasnip"
    },

    { -- Luasnip Cmp
        "saadparwaiz1/cmp_luasnip"
    },

    { --LSP Config
        "neovim/nvim-lspconfig"
    },

    { --Cmp-Nvim-LSP
        "hrsh7th/cmp-nvim-lsp"
    },

    { --LSP Signature
        "ray-x/lsp_signature.nvim"
    },

    { --Nvim Comment
        "terrortylor/nvim-comment"
    },
};


require("lazy").setup(plugins, opts);
