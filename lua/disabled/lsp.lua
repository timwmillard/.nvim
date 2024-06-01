return {
    {
        -- Mason
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason").setup({
                 ui = {
                     icons = {
                         package_installed = "✓",
                         package_pending = "➜",
                         package_uninstalled = "✗"
                     }
                 }
             })

             require("mason-lspconfig").setup()
        end
    },
}

