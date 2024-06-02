return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })

            local lspconfig = require('lspconfig')
            -- (Optional) Configure lua language server for neovim
            -- lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            vim.keymap.set('n', '<leader>fd', function()
                vim.lsp.buf.format()
            end, {})

            vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
            vim.api.nvim_set_hl(0, '@lsp.type.comment.c', {})

            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-k>'] = cmp.mapping.select_prev_item({}),
                    ['<C-j>'] = cmp.mapping.select_next_item({}),
                    ['<S-Tab>'] = cmp.mapping.abort({}),
                },
            })

        end -- function config
    },
}
