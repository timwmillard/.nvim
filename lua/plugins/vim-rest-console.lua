-- Vim REST Console (VRC)
return {
    'diepm/vim-rest-console',
    config = function()
        vim.g.vrc_output_buffer_name = '_OUTPUT.json'
        vim.g.vrc_auto_format_response_patters = {
            json = 'jq',
        }
    end
}
