local function keymap (mode, cmd, action, opts)
  opts = opts or { noremap = true, silent = false }
  vim.api.nvim_set_keymap(mode, cmd, action, opts)
end

vim.g.mapleader = " "
keymap('n', '<Space>', '<NOP>') -- stops space from moving cursor in nmode

keymap('i', '<C-c>', '<Esc>`^')
keymap('n', '<C-c>', '<Esc>')

keymap('n', '<C-a>', 'ggVG')
keymap('n', '<C-s>', ':w<CR>')

keymap('v', '/', "<ESC>/\\%V" ) -- search inside select visual lines

keymap('n', '<Tab><Tab>', ':e#<CR>') -- jump to last opened buffer

keymap('n', 'x', '"_x') -- disable yank on x

-- New tab
keymap('n', 'te', ':tabedit')

-- sets breakpoints for undo
keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')
keymap('i', '?', '?<c-g>u')

-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Esc to detach from terminal
keymap('t', '<Esc>', '<C-\\><C-n>')

-- remove Shift+Direction jumps in v mode
keymap('v', '<S-Up>', 'v<Up>')
keymap('v', '<S-Down>', 'v<Down>')
keymap('v', '<S-Left>', 'v<Left>')
keymap('v', '<S-Right>', 'v<Right>')

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

-- Harpoon
keymap('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>')
keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
