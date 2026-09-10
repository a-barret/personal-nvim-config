vim.pack.add({ 'https://github.com/OXY2DEV/markview.nvim' })

local config = {
    preview = {
        enable = false,
    },
}

require('markview').setup(config)
