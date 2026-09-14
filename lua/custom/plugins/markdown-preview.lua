vim.pack.add({
  { src = "https://github.com/iamcco/markdown-preview.nvim", load = false },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd.packadd("markdown-preview.nvim")
    vim.g.mkdp_filetypes = { "markdown" }
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { buffer = true })
  end,
})
