-- Vim REST Console (VRC)
-- :let g:vrc_show_command = 1
return {
    'diepm/vim-rest-console',
    config = function()
        vim.g.vrc_output_buffer_name = '_OUTPUT.json'
        vim.g.vrc_auto_format_response_patters = {
            json = 'jq',
        }
    end
}
