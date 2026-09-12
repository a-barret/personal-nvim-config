vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" }) -- dark theme

require('gruvbox').setup {
  contrast = 'hard',
  terminal_colors = true,
}

local function get_macos_appearance()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if not handle then return "light" end
  local result = handle:read("*a")
  handle:close()
  if result:match("Dark") then
    return "dark"
  end
  return "light"
end

local function apply_theme()
  local mode = get_macos_appearance()
  vim.o.background = mode
  vim.cmd.colorscheme 'gruvbox'
end

-- Run once on startup
apply_theme()

-- Re-check whenever nvim regains focus (e.g. you switched theme, then tabbed back)
vim.api.nvim_create_autocmd("FocusGained", {
  callback = apply_theme,
})

-- Optional: also poll periodically in case you never lose focus (e.g. tmux/terminal-only workflow)
local timer = vim.loop.new_timer()
if timer then
  timer:start(0, 5000, vim.schedule_wrap(apply_theme))
end
