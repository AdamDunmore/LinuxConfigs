require("nvim-tree").setup({

})

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Nvim Tree Toggle
vim.keymap.set({"n", "i", "v"}, '<C-f>',function () vim.cmd ":NvimTreeToggle<CR>" end , { noremap = false, silent= true })
