return {
    'sainnhe/everforest',
    lazy = false,
    priority = 999,
    config = function()
        vim.g.everforest_background = 'hard'
        vim.g.everforest_better_performance = 1
        vim.cmd('colorscheme everforest')
    end,
}
