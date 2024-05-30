return {
    'lucidph3nx/nvim-sops',
    config = function()
        -- vim.keymap.set('n', '<leader>sd', ':SopsDecrypt<CR>')
        -- vim.keymap.set('n', '<leader>se', ':SopsEncrypt<CR>')

        require('nvim_sops').setup {
            enabled = true,
            debug = false,
            binPath = 'sops', -- assumes its on $PATH
            defaults = { -- overriding any env vars as needed
                -- awsProfile = 'AWS_PROFILE',
                -- ageKeyFile = 'SOPS_AGE_KEY_FILE',
                -- gcpCredentialsPath = 'GOOGLE_APPLICATION_CREDENTIALS',
            }
        }
    end
}
