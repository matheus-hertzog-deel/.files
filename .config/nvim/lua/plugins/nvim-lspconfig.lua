return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts) -- extend opts set elsewhere
    -- opts.servers.vtsls.keys = {}

    opts.diagnostics = {
      float = {
        border = "rounded",
      },
    }
  end,
}
