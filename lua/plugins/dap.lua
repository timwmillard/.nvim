return {
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            -- require('telescope').load_extension('dap')
        end
    },
    'nvim-telescope/telescope-dap.nvim',
}
