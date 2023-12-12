vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    view = {
        width = 40,
    },
})

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
