require("gitsigns").setup()

-- Default keybindings notes:
--
-- ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
-- ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
--
-- ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
-- ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
-- ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
-- ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
-- ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
-- ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
-- ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
-- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
-- ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
-- ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
