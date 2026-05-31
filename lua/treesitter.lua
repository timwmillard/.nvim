
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "" then
      return
    end

    pcall(vim.treesitter.start, args.buf)
  end,
})
