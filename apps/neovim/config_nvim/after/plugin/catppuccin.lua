local catppuccin = require("catppuccin")

catppuccin.setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "macchiato",
    }
})

vim.cmd.colorscheme "catppuccin"
