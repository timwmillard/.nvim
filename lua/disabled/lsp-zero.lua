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

            local diagnostic_opts = {
                -- Disable underline, it's very annoying
                underline = false,
                -- Enable virtual text, override spacing to 4
                virtual_text = { spacing = 4 },
                signs = true,
                update_in_insert = false,
            }
            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                -- Need to update diagnostic after plugins load
                vim.diagnostic.config(diagnostic_opts)
            end)
            vim.keymap.set('n', '<leader>dd', function()
                -- hack to remove underline
                vim.diagnostic.config(diagnostic_opts)
            end, {})

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
            local opts = {
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                vim.api.nvim_get_runtime_file("", true),
                            }
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls(opts))

            lspconfig.postgres_lsp.setup{
                cmd = { "postgrestools", "lsp-proxy" },
                filetypes = { "sql", "psql" },
                single_file_support = true,
                root_dir = lspconfig.util.root_pattern "postgrestools.jsonc"
            }

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
