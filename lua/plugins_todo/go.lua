local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
    gofmt = 'gofmt',
    lsp_cfg = {
        capabilities = capabilities,
        -- other setups
    },
})

-- auto gofmt and goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})

-- Go singature help
local signature_setup = {}
local golang_setup = {
    on_attach = function(_, bufnr)
        require('lsp_signature').on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
    end,
}
require('lspconfig').gopls.setup(golang_setup)


vim.keymap.set('n', '<leader>gofs', ':GoFillStruct<CR>')
vim.keymap.set('n', '<leader>goat', ':GoAddTag<CR>')
vim.keymap.set('n', '<leader>gort', ':GoRmTag<CR>')
vim.keymap.set('n', '<leader>gott', ':GoTestFunc<CR>') -- Test Function
vim.keymap.set('n', '<leader>gotf', ':GoTestFile<CR>') -- Test File
vim.keymap.set('n', '<leader>gotp', ':GoTestPkg<CR>')  -- Test Package
vim.keymap.set('n', '<leader>gota', ':GoTest<CR>')     -- Test All
vim.keymap.set('n', '<leader>goie', ':GoIfErr<CR>')
vim.keymap.set('n', '<leader>gor', ':GoRename<CR>')


vim.keymap.set('n', '<leader>goe', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>b')

