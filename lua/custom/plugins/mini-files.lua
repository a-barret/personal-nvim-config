require('mini.files').setup {
  mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = 'L',
    go_out      = 'h',
    go_out_plus = 'H',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trash       = 'X',
  },
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 40,
  },
  options = {
    use_as_default_explorer = true,
  },
}

vim.keymap.set('n', '<leader>e', function()
  require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
end, { desc = 'Open mini.files (current file)' })

vim.keymap.set('n', '<leader>E', function()
  require('mini.files').open(vim.uv.cwd(), true)
end, { desc = 'Open mini.files (cwd)' })
