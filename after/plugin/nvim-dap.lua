require("dapui").setup()

require("nvim-dap-virtual-text").setup()

require("dap").adapters.lldb = {
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

require('dap').configurations.c = {
    lldb -- different debuggers or more configurations can be used here
}

vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)

