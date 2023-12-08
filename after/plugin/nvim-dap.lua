require("dapui").setup()

require("nvim-dap-virtual-text").setup()

local dap = require("dap")


dap.adapters.lldb = {
    type = "executable",
    command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
    name = "lldb",
}

local lldb = {
    name = "Launch lldb",
    type = "lldb",      -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
        return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
}

dap.configurations.c = {
    lldb -- different debuggers or more configurations can be used here
}

vim.fn.sign_define('DapBreakpoint',{ text ='🛑', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dd', function() dap.step_over() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)

vim.keymap.set('n', '<leader>dv',
    function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
    end)
