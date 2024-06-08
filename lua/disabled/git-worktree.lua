return {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('git-worktree').setup({
            -- change_directory_command = <str> -- default: "cd",
            -- update_on_change = <boolean> -- default: true,
            -- update_on_change_command = <str> -- default: "e .",
            -- clearjumps_on_change = <boolean> -- default: true,
            -- autopush = <boolean> -- default: false,
        })
        local telescope = require("telescope")
        telescope.load_extension("git_worktree")

        vim.keymap.set('n', '<leader>gw', telescope.extensions.git_worktree.git_worktrees, {}) -- Git worktree
        vim.keymap.set('n', '<leader>wt', telescope.extensions.git_worktree.create_git_worktree, {}) -- Worktree Create
    end
}
