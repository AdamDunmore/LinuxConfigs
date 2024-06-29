local lsp_zero = require("lsp-zero");
local cmp = require('cmp');
local ls = require('luasnip');
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

--Autocompletion Keybinds
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },

    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	end
	cmp.confirm()
      else
        fallback()
      end
    end, {"i","s","c",}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    },

    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
})

require("lazy-lsp").setup {
    preferred_servers = {
        python = { "pyright" },
        css = {"cssls"}
    }
}


