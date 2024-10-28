return {
    'glepnir/lspsaga.nvim',
    event = 'LspAttach',
    lazy = true,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional,
        'nvim-tree/nvim-web-devicons'     -- optional
    },
    config = function()
        local saga = require('lspsaga')

        saga.setup {
            border_style = "rounded",

            lightbulb = {
                enable = false,
                enable_in_insert = false,
                cache_code_action = true,
                sign = true,
                update_time = 150,
                sign_priority = 20,
                virtual_text = true,
            },
        }

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
        vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        vim.keymap.set('n', 'gy', '<Cmd>Lspsaga goto_type_definition<CR>', opts)

        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
        vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
        vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga code_action<CR>", { silent = true })

        vim.keymap.set("n", "<leader>s", "<cmd>Lspsaga outline<CR>", { silent = true })
        vim.keymap.set("n", "<C-t>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
        vim.keymap.set("t", "<C-t>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
    end
}

