local dap, dapui = require("dap"), require("dapui")

dapui.setup()

-- dap.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true, silent = true })

require("dap-go").setup {
    {
        dap_configurations = {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
    delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {}
    },
}

require("dap-python").setup(vim.fn.getcwd() .. "/.venv/bin/python")
