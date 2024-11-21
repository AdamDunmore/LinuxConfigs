require('toggleterm').setup({
    autochdir = true;

})

vim.api.nvim_set_keymap(
        'n',
        '<C-t>',
        ":ToggleTerm direction=float<CR>",
        {noremap = false, silent = true}
)
