local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')

telescope.load_extension('harpoon')
telescope.load_extension('neoclip')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<C-h>"] = actions.which_key,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-w>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-Down>"] = actions.cycle_history_next,
        ["<C-Up>"] = actions.cycle_history_prev,
      }
    },
  },
  pickers = {
    live_grep = {
      only_sort_text = true,
      hidden = true,
    },
    find_files = {
      hidden = true,
      find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
    }
  }
}



local function keymap (mode, cmd, action, opts)
  opts = opts or { noremap = true, silent = false }
  vim.api.nvim_set_keymap(mode, cmd, action, opts)
end


keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>')
keymap('n', ';f', '<cmd>Telescope find_files<cr>')

keymap('n', ';r', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')

keymap('n', '\\\\', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap('n', '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap('n', ';<Tab>', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<leader>v', '<cmd>Telescope neoclip<cr>')
keymap('n', ';e', '<cmd>Telescope diagnostics<cr>')
keymap('n', ';;', '<cmd>Telescope resume<cr>')

