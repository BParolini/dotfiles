local dap = require("dap")
local dapui = require("dapui")

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

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true}
})

require("dap-python").setup(vim.fn.getcwd() .. "/.venv/bin/python")