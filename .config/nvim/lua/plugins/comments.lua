require('nvim_comment').setup({
    create_mappings = false

})

vim.api.nvim_set_keymap(
        'v',
        '<C-_>',
        ":CommentToggle<CR>",
        {noremap = false, silent = true}
)
