vim.o.termguicolors = true
require("catppuccin").setup {
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha"
    },
    transparent_background = true,
    term_colors = true
}

vim.cmd.colorscheme "catppuccin-mocha"
