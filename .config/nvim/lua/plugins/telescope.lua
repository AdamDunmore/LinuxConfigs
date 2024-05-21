--Imports telescope
local telescope = require("telescope.builtin")

--Function to find all files in CWD
local function telescope_find_files_cwd()
        telescope.find_files( { cwd = vim.fn.expand("%:p:h") } )
end

--Function to find all files from root directory Note: Terrible Performance
local function telescope_find_files_root()
    telescope.find_files( { cwd = "~/" } )
end

--Function to open project menu
local function telescope_project_menu()
  require'telescope'.extensions.project.project{}  
end

--Bind functions to commands
vim.api.nvim_create_user_command("TelescopeFindFilesCWD", telescope_find_files_cwd, {})
vim.api.nvim_create_user_command("TelescopeFindFilesRoot", telescope_find_files_root, {})
vim.api.nvim_create_user_command("TelescopeOpenProjects", telescope_project_menu, {})

--Telescope Setup
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules", "target" }
    },

    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true
        }
    }
}

require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')

vim.api.nvim_set_keymap(
        'n',
        '<C-p>',
        ":TelescopeOpenProjects<CR>",
        {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<C-f>',
    ":Telescope file_browser<CR>",
    {noremap = false, silent = true}
)
