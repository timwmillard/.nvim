local dev = true
local path = vim.fn.expand("~/dev/image_preview.nvim")

if not vim.loop.fs_stat(path) then
    return {}
end

return {
    {
        'adelarsq/image_preview.nvim',
        dir = dev and path or nil,
        dev = dev,
        event = 'VeryLazy',
        config = function()
            require("image_preview").setup()
        end
    }
}

