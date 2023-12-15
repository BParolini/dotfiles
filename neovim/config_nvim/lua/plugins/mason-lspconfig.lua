return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local lsp = require('lsp-zero')

        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "dockerls",
                "docker_compose_language_service",
                "emmet_ls",
                "gopls",
                "lua_ls",
                "marksman",
                "pylsp",
                "rust_analyzer",
                "yamlls",
            },
            handlers = {
                lsp.default_setup,
            },
        })
    end,
}
