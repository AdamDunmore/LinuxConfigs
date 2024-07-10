local Popup = require("nui.popup")
local Layout = require("nui.layout")
local event = require("nui.utils.autocmd").event

local help_visual = {
    "v: Enter visual mode",
    "y: Copy/Yank", 
    "c: Cut", 
    "v: Paste"
}

local help_plugins = {
    "Leader-tf: File Browser", 
    "Leader-tc: Search Files", 
    "Leader-tp: Search Projects", 
    "Leader-tb: Search Buffers", 
    "Leader-h: Display Help"
}

local popupVisual = Popup({
    border = {
        style = "rounded",
        text = {
            top = "Visual"
        }
    },
})


local popupPlugins = Popup({
    border = {
        style = "rounded",
        text = {
            top = "Plugins"
        }
    },
})

local layout = Layout(
    {
        position = "50%",
        size = {
            width = "80%",
            height = "60%"
        }
    },
    Layout.Box({
        Layout.Box(popupVisual, {size = "50%"}),
        Layout.Box(popupPlugins, {size = "50%"})
    })
)

local help_open = false
local help_mounted = false


local function Toggle_Help()
    if not help_mounted then layout:mount(); help_mounted = true;
    elseif help_open then layout:hide();     
    elseif not help_open then layout:show()
    end
    help_open = not help_open
end

vim.api.nvim_buf_set_lines(popupVisual.bufnr, 0, 1, false, help_visual)
vim.api.nvim_buf_set_lines(popupPlugins.bufnr, 0, 1, false, help_plugins)

vim.keymap.set({'n', 'i', 'v'}, '<leader>h', Toggle_Help, { noremap = false })
