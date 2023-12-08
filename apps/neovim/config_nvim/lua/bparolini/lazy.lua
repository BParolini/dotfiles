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
    -- Simple games which help to learn how to work with VIM
    "ThePrimeagen/vim-be-good",

    -- Mark files to jump around more easily
    "ThePrimeagen/harpoon",

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    { "christoomey/vim-tmux-navigator", lazy = false },

    -- { "catppuccin/nvim",                name = "catppuccin" },
    { "arcticicestudio/nord-vim",       name = "nord" },
    "ryanoasis/vim-devicons",

    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    { "github/copilot.vim",              build = ":Copilot enable" },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",             -- Required
            { "williamboman/mason.nvim", build = ":MasonUpdate" },
            "williamboman/mason-lspconfig.nvim", -- Optional
            "simrat39/rust-tools.nvim",

            -- Debugger Adapter Protocol (DAP) dependencies
            {
                "mfussenegger/nvim-dap",
                name = "dap",
                dependencies = {
                    "mfussenegger/nvim-dap-python",
                    "leoluz/nvim-dap-go",
                    { "rcarriga/nvim-dap-ui", name = "dapui" },
                    "theHamsta/nvim-dap-virtual-text",
                    "nvim-telescope/telescope-dap.nvim",
                }
            },

            "folke/neodev.nvim",
            "mfussenegger/nvim-lint",
            "mhartington/formatter.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",     -- Required
            "hrsh7th/cmp-nvim-lsp", -- Required
            "L3MON4D3/LuaSnip",     -- Required
        },
    },
})
