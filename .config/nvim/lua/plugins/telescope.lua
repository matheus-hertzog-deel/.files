return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find File",
    },
    {
      ";r",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      ";;",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "Resume",
    },
    {
      ";b",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
  },
  -- change some options
  opts = {
    defaults = {
      winblend = 0,
    },
  },
}
