
require("lspconfig").tailwindcss.setup({
  filetypes = {
    'templ',
    'heex',
    -- include any other filetypes where you need tailwindcss
  },
  init_options = {
      userLanguages = {
        templ = "html",
        heex = "html",
      }
  }
})

