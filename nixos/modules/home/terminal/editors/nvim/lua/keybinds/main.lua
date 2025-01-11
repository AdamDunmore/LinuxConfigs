local ls = require("luasnip");

-- Navigation --
-- Telescope
vim.api.nvim_set_keymap(
    'n',
    '<leader>fr',
    ":ADTelescopeFindFilesRoot<CR>",
    { noremap = true, silent = true }
);

vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    ":Telescope find_files<CR>",
    { noremap = true, silent = true }
);

vim.api.nvim_set_keymap(
    'n',
    '<leader>fb',
    ":Telescope buffers<CR>",
    { noremap = true, silent = true }
);

vim.api.nvim_set_keymap(
    'n',
    '<leader>fe',
    ":ADNUIFileExplorerHelp<CR>:Telescope file_browser<CR>",
    { noremap = true, silent = true }
);

vim.api.nvim_set_keymap(
    'n',
    '<leader>fp',
    ":Telescope project<CR>",
    { noremap = true, silent = true }
);

-- Code --
-- Luasnip
vim.api.nvim_set_keymap(
    'i',
    '<C-k>',
    '<Esc>:ADLuasnipJumpF<CR>',
    { noremap = false, silent = true }
)

vim.api.nvim_set_keymap(
    'i',
    '<C-j>',
    '<Esc>:ADLuasnipJumpB<CR>',
    { noremap = false, silent = true }
)
