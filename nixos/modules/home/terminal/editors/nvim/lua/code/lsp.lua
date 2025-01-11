local lsp_config = require('lspconfig');
local capabilities = require('cmp_nvim_lsp').default_capabilities();

-- Signatures
require('lsp_signature').setup({
    bind = true,
    hint_enable = true,
    floating_window = true,
    handler_opts = {
        border = "rounded"
    }
});

-- Java
lsp_config.jdtls.setup({
    capabilities = capabilities,
})

-- Lua
lsp_config.lua_ls.setup({
    capabilities = capabilities,
})

-- Python
lsp_config.lua_ls.setup({
    capabilities = capabilities,
})

-- Java/Typescript 
lsp_config.ts_ls.setup({
    capabilities = capabilities,
})

-- Nix
lsp_config.nil_ls.setup({
    capabilities = capabilities,
})

-- Rust
lsp_config.rust_analyzer.setup({
    capabilities = capabilities,
})
