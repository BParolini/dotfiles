vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'christoomey/vim-tmux-navigator', lazy = false }

    -- use 'navarasu/onedark.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use('ryanoasis/vim-devicons')

    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons')

    use('nvim-lualine/lualine.nvim')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('github/copilot.vim')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = ":MasonUpdate"
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'mfussenegger/nvim-dap',            as = 'dap' },
            { 'mfussenegger/nvim-dap-python' },
            { 'leoluz/nvim-dap-go' },
            { 'folke/neodev.nvim' },
            { 'rcarriga/nvim-dap-ui',             as = 'dapui' },
            { 'theHamsta/nvim-dap-virtual-text' },
            { 'nvim-telescope/telescope-dap.nvim' },
            { 'mfussenegger/nvim-lint' },
            { 'mhartington/formatter.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
