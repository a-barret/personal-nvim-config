-- 24-bit color
vim.opt.termguicolors = true

vim.pack.add({ 'https://github.com/nvim-tree/nvim-tree.lua' })

local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  sync_root_with_cwd = false,

  actions = {
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
}

require('nvim-tree').setup(config)

-- global keymap to open the tree from anywhere
vim.keymap.set('n', '<leader>e', function()
  require('nvim-tree.api').tree.open()
end, { noremap = true, silent = true, desc = 'nvim-tree: Open' })

-- Custom command to resync cwd with nvim-tree root
vim.api.nvim_create_user_command("NvimTreeCdRoot", function()
  local ok, core = pcall(require, "nvim-tree.core")
  local cwd = ok and core.get_cwd()

  if not cwd then
    vim.notify("nvim-tree: could not determine current root", vim.log.levels.WARN)
    return
  end

  vim.cmd.lcd(cwd)
end, { desc = "Change window's cwd to nvim-tree's current root" })

-- Keymap for NvimTreeCdRoot sync function
vim.keymap.set("n", "<leader>cr", "<cmd>NvimTreeCdRoot<cr>", { desc = "Sync cwd to nvim-tree root" })

-- Open nvim-tree automatically at startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('nvim-tree.api').tree.open()
  end,
})
