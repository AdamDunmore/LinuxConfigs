-- Adds line numbers
vim.opt.number = true

-- Adds relative line numbers
vim.opt.relativenumber = true

-- Adds mouse support 
vim.opt.mouse = "a"

-- Sets time for plugins to take effect after typing
vim.opt.updatetime = 300

-- Tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Binds Telescope File Search
vim.keymap.set({ "n", "v", "i" }, '<C-l>', function () vim.cmd ":TelescopeFindFilesCWD" end, { noremap = false })
