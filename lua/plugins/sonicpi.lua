return {
    'magicmonty/sonicpi.nvim',
    dependencies  = {
        'hrsh7th/nvim-cmp',
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        local default_mapping_opts = { noremap = true, silent = true, buffer = 0 }

        require('sonicpi').setup({
            server_dir = '/Applications/Sonic Pi.app/Contents/Resources/app/server',
            mappings = {
                { 'n', '<leader>s', require('sonicpi.remote').stop, default_mapping_opts },
                { 'i', '<M-s>', require('sonicpi.remote').stop, default_mapping_opts },
                { 'n', '<leader>r', require('sonicpi.remote').run_current_buffer, default_mapping_opts },
                { 'i', '<M-r>', require('sonicpi.remote').run_current_buffer, default_mapping_opts },
            },
        })
    end
}

