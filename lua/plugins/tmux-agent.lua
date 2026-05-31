return {
    dir = vim.fn.expand('~/dev/tmux-agent.nvim'),
    name = 'tmux-agent',
    lazy = false,
    config = function()
        require('tmux-agent').setup()
        local ta = require('tmux-agent')

        vim.keymap.set('n', '<leader>cc', function() ta.send_location('claude') end,    { desc = 'Send to claude' })
        vim.keymap.set('v', '<leader>cc', function() ta.send_selection('claude') end,   { desc = 'Send selection to claude' })

        vim.keymap.set('n', '<leader>co', function() ta.send_location('opencode') end,  { desc = 'Send to opencode' })
        vim.keymap.set('v', '<leader>co', function() ta.send_selection('opencode') end, { desc = 'Send selection to opencode' })

        vim.keymap.set('n', '<leader>cg', function() ta.send_location('codex') end,     { desc = 'Send to codex' })
        vim.keymap.set('v', '<leader>cg', function() ta.send_selection('codex') end,    { desc = 'Send selection to codex' })
    end,
}
