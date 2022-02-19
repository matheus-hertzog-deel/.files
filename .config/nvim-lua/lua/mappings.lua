local M = {}
local default_opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
function keymap (mode, cmd, action, opts)
  opts = opts or default_opts
  vim.api.nvim_set_keymap(mode, cmd, action, default_opts)
end

vim.g.mapleader = " "
keymap('n', '<Space>', '<NOP>') -- stops space from moving cursor in nmode

keymap('n', '<esc>', ':nohlsearch <cr>') -- esc to clear highlighted search

-- sets breakpoints for undo
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap('i', '?', '?<c-g>u')

-- Esc to detach from terminal
keymap('t', '<Esc>', '<C-\\><C-n>')

-- remove Shift+Direction jumps in v mode
keymap('v', '<S-Up>', 'v<Up>')
keymap('v', '<S-Down>', 'v<Down>')
keymap('v', '<S-Left>', 'v<Left>')
keymap('v', '<S-Right>', 'v<Right>')

keymap('n', '<leader>so', ':source ~/.config/nvim/init.lua<cr>')

-- leader+hjkl to swap between splits
keymap('n','<leader>h', ':wincmd h<CR>')
keymap('n', '<leader>j', ':wincmd j<CR>')
keymap('n', '<leader>k', ':wincmd k<CR>')
keymap('n', '<leader>l', ':wincmd l<CR>')


-- ctrl+arrow to resize current split
keymap('n', '<C-Left>', ':vertical resize +3<CR>')
keymap('n', '<C-Right>', ':vertical resize -3<CR>')
keymap('n', '<C-Up>', ':resize +3<CR>')
keymap('n', '<C-Down>', ':resize -3<CR>')

-- quickfix list
keymap('n', ']q', ':call ToggleQuickfixList() <CR>')
keymap('n', '<leader>ag', ':Ag<CR> ')
keymap('n', '<leader>rg', ':Rg<CR>')

-- Tree Explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap('n', '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>')

-- Bufferline
-- keymap('n', '<S-Tab>', ':BufferLineCyclePrev<cr>')
-- keymap('n', '<Tab>', ':BufferLineCycleNext<cr>')
-- keymap('n', '<C-w>', ':bp<bar>sp<bar>bn<bar>bd<CR>')  -- closes current buffer
-- keymap('n', 'gb', ':BufferLinePick<CR>')
keymap('n', '<C-Tab>', ':tabn<CR>')


-- Harpoon
keymap('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>')
keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- LSP
-- keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('n', '<leader>q', ':TroubleToggle')


keymap('n', ']c', '<cmd>Gitsigns next_hunk<CR>')
keymap('n', '[c', '<cmd>Gitsigns prev_hunk<CR>')
keymap('n', '<leader>hb', ':Gitsigns toggle_current_line_blame<CR>')
