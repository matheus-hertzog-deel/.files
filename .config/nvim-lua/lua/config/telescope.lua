local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
  },
  pickers = {
    live_grep = {
      only_sort_text = true
    }
  }
}

require("telescope").load_extension('harpoon')

