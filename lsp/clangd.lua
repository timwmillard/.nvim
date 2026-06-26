
-- format on save for C files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.c', '*.h' },
  callback = function() vim.lsp.buf.format({ async = false }) end,
})

---@type vim.lsp.Config
return {
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=iwyu',
        '--completion-style=detailed',
        '--fallback-style=none',
        '--function-arg-placeholders=false',
    },
    filetypes = { 'c', 'cpp', 'h' },
    root_markers = {
        '.git',
        '.clangd',
        'compile_commands.json',
        'compile_flags.txt',
  },
}
