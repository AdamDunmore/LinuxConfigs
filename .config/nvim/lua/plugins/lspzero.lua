--Language Server Link
--https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local cmp = require('cmp')

--Autocompletion Keybinds
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },

    mapping = {
        ['<tab>'] = cmp.mapping.confirm({select = false}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },				
})
--Language Servers

--Lua
require'lspconfig'.lua_ls.setup{}

--Pyright
require'lspconfig'.pyright.setup{}

--Rust-Analyzer
require'lspconfig'.rust_analyzer.setup{}

--Java/Typescript
require'lspconfig'.tsserver.setup{}

--Java
require'lspconfig'.jdtls.setup{}

--Go
require'lspconfig'.gopls.setup{}

--C
require'lspconfig'.clangd.setup{}
