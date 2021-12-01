local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-Left>',  ':BufferPrevious<CR>', opts)
map('n', '<C-Right>', ':BufferNext<CR>',     opts)

-- Re-order to previous/next
map('n', '<C-S-Left>', ':BufferMovePrevious<CR>', opts)
map('n', '<C-S-Right>', ' :BufferMoveNext<CR>', opts)

-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)

-- Close buffer
-- map('n', '<A-c>', ':BufferClose<CR>', opts)

-- Close commands
-- :BufferCloseAllButCurrent<CR>
-- :BufferCloseBuffersLeft<CR>
-- :BufferCloseBuffersRight<CR>

-- Sort automatically by...
-- map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
-- map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
-- map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
