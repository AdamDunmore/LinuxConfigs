--Feline Setup
vim.opt.termguicolors = true
vim.opt.cmdheight = 0

-- Gets providers
local vi_mode = require('feline.providers.vi_mode')

--Defines Constants
local text_colour = '#000000'
local background_colour = '#CCCCCC'

--Components
--
-- Creates component table
local component = {}

--File Name Component
component.file_name = {
    provider = function() return " " .. vim.fn.expand('%:t') .. " " end,
    hl = function ()
        return{
            fg = text_colour,
            bg = background_colour,
        }
    end,
    right_sep = '    '
}

--Line Number Component
component.line_number = {
    provider = function () return " " .. tostring(unpack(vim.api.nvim_win_get_cursor(0))) .. " " end,
    hl = function ()
        return{
            fg = text_colour,
            bg = background_colour,
        }   
    end,
    right_sep = ""
}

--Date Component
component.date = {
    provider = function () return " " .. tostring(os.date('%m/%d/%y %H:%M:%S',t0)) .. " " end,
    hl = function ()
        return{
            fg = text_colour,
            bg = background_colour,
        }
    end,
    right_sep = ''
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
    hl = function ()
        return{
            fg = text_colour,
            bg = background_colour,
        }
    end,
    right_sep = '   '
}

--Creates Variable to store layout
local components_table = {
    active = {
        {component.file_name, component.line_number}, --Left
        {component.date}, --Middle
        {component.current_lsp} --Right
    }
}

--Feline Setup
require('feline').setup({components = {}})
require('feline').winbar.setup({components = components_table})       -- to use winbar
