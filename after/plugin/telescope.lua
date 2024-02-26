
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({hidden = true, no_ignore=true})
end)

vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>qf', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>rf', builtin.resume, {})
vim.keymap.set('n', '<leader>sp', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>cm', builtin.commands, {})
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})
vim.keymap.set('n', '<leader>man', builtin.man_pages, {})

vim.keymap.set('n', '<leader>de', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, {})

-- vim.keymap.set('n', '<leader>ld', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, {})
-- vim.keymap.set('n', '<leader>ldw', builtin.lsp_dynamic_workspace_symbols, {})
-- vim.keymap.set('n', '<leader>li', builtin.lsp_incoming_calls, {})
-- vim.keymap.set('n', '<leader>lo', builtin.lsp_outgoing_calls, {})


vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, {}) -- Still WIP

-- vim.keymap.set('n', '<leader>fa', function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end) -- This is not working!!


