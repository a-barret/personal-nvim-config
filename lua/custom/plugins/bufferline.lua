vim.pack.add({ 'https://github.com/akinsho/bufferline.nvim.git' })

local config = {
    options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        offsets = {
            { filetype = 'NvimTree', text = 'File Explorer', text_align = 'left' },
        },
    },
}

require('bufferline').setup(config)
