local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    "bash-language-server",
    "cmake-language-server",
    "gopls",
    "gradle-language-server",
    "java-language-server",
    "json-lsp",
    "kotlin-language-server",
    "lua-language-server",
    "python-lsp-server",
    "rust-analyzer",
    "sqlls",
    "yaml-language-server",
    "cpptools",
    "bash-debug-adapter",
    "debugpy",
    "go-debug-adapter",
    "java-debug-adapter",
    "kotlin-debug-adapter",
    "cmakelint",
    "cpplint",
    "flake8",
    "markdownlint",
    "shellcheck",
    "golangci-lint",
    "jsonlint",
    "ktlint",
    "luacheck",
    "protolint",
    "yamllint",
    "autoflake",
    "cmakelang",
    "google-java-format",
    "jq",
    "luaformatter",
    "ktlint",
    "rustfmt",
    "sql-formatter",
    "yamlfix"
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({select=true}),
    ['<C-space>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr , remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
