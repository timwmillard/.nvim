
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>hp', ui.toggle_quick_menu)
vim.keymap.set('n', '<C-k>', ui.nav_prev)
vim.keymap.set('n', '<C-j>', ui.nav_next)

require("telescope").load_extension('harpoon')
vim.keymap.set('n', '<leader>fh', ':Telescope harpoon marks<CR>')

