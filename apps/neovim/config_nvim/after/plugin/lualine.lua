require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "material",
    },
    sections = {
        lualine_c = {
            {
                "filename",
                path = 1,
            }
        }
    }
}
