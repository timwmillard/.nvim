local on_attach = function(client, bufnr)
end

-- https://blog.viktomas.com/graph/neovim-native-built-in-lsp-autocomplete/
-- https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.completeopt = {'menuone', 'noselect', 'popup', 'fuzzy'}

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf,
                {
                    autotrigger = true,
                    convert = function(item)
                        return { abbr = item.label:gsub("%b()", "") }
                    end,
                }
            )
        end

        vim.keymap.set("i", "<C-space>", vim.lsp.completion.get,
            { desc = "trigger autocompletion" }
        )

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
            { noremap=true, silent=true, buffer=ev.buf }
        )
    end
})

vim.diagnostic.config({ virtual_text = { current_line = true} })

vim.lsp.enable({
    'clangd',
    'gopls',
    'lua_ls',
})

