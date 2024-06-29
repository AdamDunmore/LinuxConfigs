local lsp_zero = require("lsp-zero");

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

require("lazy-lsp").setup {
    preferred_servers = {
        python = { "pyright" }
    }
}


