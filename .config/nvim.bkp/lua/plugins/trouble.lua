return {
    'folke/trouble.nvim',
    verylazy = true,
    config = function()
        require('trouble').setup {
            icons = false,
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        }

        vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle workspace_diagnostics<cr>",
            {silent = true, noremap = true}
        )
    end
}
