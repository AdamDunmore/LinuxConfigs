--Imports telescope
local telescope = require("telescope.builtin")

--Function to find all files from root directory Note: Terrible Performance
local function telescope_find_files_root()
    telescope.find_files( { cwd = "~/" } )
end

--Bind functions to commands
vim.api.nvim_create_user_command("TelescopeFindFilesRoot", telescope_find_files_root, {})

--Telescope Setup
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { 
            "node_modules", -- JS
            "target", -- Rust
            ".*%.o" -- C/Cpp
        }
    },

    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
}

require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')

vim.api.nvim_set_keymap(
        'n',
        '<leader>tp',
        ":Telescope project<CR>",
        {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>tf',
    ":Telescope file_browser<CR>",
    {noremap = false, silent = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>tc',
    ":Telescope find_files<CR>",
    {noremap = false, silent = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>tb',
    ":Telescope buffers<CR>",
    {noremap = false, silent = true}
)
