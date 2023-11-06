local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "ThePrimeagen/vim-be-good",

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    { "christoomey/vim-tmux-navigator", lazy = false },

    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    "ryanoasis/vim-devicons",

    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig", -- Required
            {                        -- Optional
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
            },
            "williamboman/mason-lspconfig.nvim", -- Optional
            "simrat39/rust-tools.nvim",
            {
                "mfussenegger/nvim-dap",
                name = "dap"
            },
            "mfussenegger/nvim-dap-python",
            "leoluz/nvim-dap-go",
            "folke/neodev.nvim",
            {
                "rcarriga/nvim-dap-ui",
                name = "dapui"
            },
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "mfussenegger/nvim-lint",
            "mhartington/formatter.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",     -- Required
            "hrsh7th/cmp-nvim-lsp", -- Required
            "L3MON4D3/LuaSnip",     -- Required
        },
    },
})
