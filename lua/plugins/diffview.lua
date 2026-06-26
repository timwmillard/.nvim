-- Git Diff
return {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    -- optional: lazy-load on command
    -- cmd = {
    --     "DiffviewOpen",
    --     "DiffviewToggle",
    --     "DiffviewFileHistory",
    --     "DiffviewDiffFiles",
    --     "DiffviewLog",
    -- },
    --
    config = function()

        vim.api.nvim_create_user_command('DiffviewOpenPR', function()
          local handle = io.popen('git rev-parse --abbrev-ref origin/HEAD 2>/dev/null')
          local result = handle:read('*a')
          handle:close()
          local default_branch = result:gsub('%s+', '')
          if default_branch == '' then
            default_branch = 'origin/main'  -- fallback
          end
          vim.cmd('DiffviewOpen ' .. default_branch .. '...')
        end, {})

    end
}
