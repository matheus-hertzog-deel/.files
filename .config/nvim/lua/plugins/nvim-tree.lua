return {
    'kyazdani42/nvim-tree.lua',

    config = function ()
        require('nvim-tree').setup({
            update_focused_file = {
                enable = true,
            },
        })
    end,
    keys = {
        { '<leader>e', '<cmd>NvimTreeToggle<cr>' },
    }

}
