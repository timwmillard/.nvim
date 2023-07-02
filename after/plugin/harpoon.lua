
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>hn', ui.nav_next)
vim.keymap.set('n', '<leader>hp', ui.nav_next)

require("telescope").load_extension('harpoon')
vim.keymap.set('n', '<leader>fh', ':Telescope harpoon marks<CR>')

