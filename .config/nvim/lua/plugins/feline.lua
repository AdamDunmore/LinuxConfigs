--Feline Setup
vim.opt.termguicolors = true
vim.opt.cmdheight = 0

--Defines Constants
local vi_modes = {
    n = "Normal",
    i = "Insert",
    v = "Visual",
    V = "Visual Line",
    ['DOESNT WORK'] = "Visual Block",
    c = "Command"
}

local style = function ()
    return {
        fg = '#000000',
        bg = '#CCCCCC',
    }
end

local function left_side()
    return " "
end

local function right_side()
    return " "
end

--Components
--
-- Creates component table
local component = {}

--File Name Component
component.file_name = {
    provider = function() return " " .. vim.fn.expand('%:t') .. " " end,
    hl = style(),
    left_sep = left_side(),
    right_sep = right_side(),
}

--Line Number Component
component.line_number = {
    provider = function () 
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        return " " .. row .. ":" .. col .. " " 
    end,
    hl = style(),
    left_sep = left_side(),
    right_sep = right_side(),
}

-- Mode
component.mode = {
    provider = function ()
        local mode = vi_modes[vim.api.nvim_get_mode().mode]
        if mode == nil then
           mode = vim.api.nvim_get_mode().mode 
        end
        return " " .. mode .. " "
    end,
    hl = style(),
    left_sep = left_side(),
    right_sep = right_side(),
}

--LSP Component
component.current_lsp = {
    provider = function ()
        local str = ""
        for _, client in ipairs(vim.lsp.get_active_clients()) do
            str = str .. client.name .. " "
        end
        return " " .. str .. " "
    end,
    hl = style(),
    left_sep = left_side(),
    right_sep = right_side(),
}

--Creates Variable to store layout
local components_table = {
    active = {
        {component.file_name, component.line_number}, --Left
        {}, --Middle
        {component.current_lsp, component.mode} --Right
    }
}

--Feline Setup
require('feline').setup({components = {}})
require('feline').winbar.setup({
    components = components_table,
})       -- to use winbar
