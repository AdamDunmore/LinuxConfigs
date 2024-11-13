require('toggleterm').setup({
    autochdir = true;

})

vim.api.nvim_set_keymap(
        'n',
        '<leader>tt',
        ":ToggleTerm direction=float<CR>",
        {noremap = false, silent = true}
)
