return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')
        local term = require('harpoon.term')
        local tmux = require('harpoon.tmux')

        vim.keymap.set('n', '<leader> ', mark.add_file)
        vim.keymap.set('n', '<leader>l', ui.toggle_quick_menu)
        vim.keymap.set('n', '<C-k>', ui.nav_prev)
        vim.keymap.set('n', '<C-j>', ui.nav_next)

        -- terminal
        vim.keymap.set('n', '<leader>tt', function() term.gotoTerminal(1) end)

        -- tmux
        vim.keymap.set('n', '<leader>tm', function() tmux.gotoTerminal(1) end)

        require("telescope").load_extension('harpoon')
        vim.keymap.set('n', '<leader>fm', ':Telescope harpoon marks<CR>')
    end
}
