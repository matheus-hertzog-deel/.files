return {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim'
    },
    config = function ()
        local telescope = require('telescope')
        telescope.load_extension('live_grep_args')

        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        telescope.setup{
            defaults = {
                mappings = {
                    n = {
                        ['q'] = actions.close,
                        ['dd'] = actions.delete_buffer
                    },
                    i = {
                        ['<C-h>'] = actions.which_key,
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<C-w>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<C-Down>'] = actions.cycle_history_next,
                        ['<C-Up>'] = actions.cycle_history_prev,
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
    end,

    keys = {
        { '<C-p>', '<cmd>Telescope find_files<cr>' },
        { ';f', '<cmd>Telescope find_files<cr>' },
        { ';r', '<cmd>Telescope live_grep<cr>' },
        { ';b', '<cmd>Telescope buffers<cr>' },
        { '<leader>h', '<cmd>Telescope help_tags<cr>' },
        { '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>' },
        { ';<Tab>', '<cmd>Telescope oldfiles<cr>' },
        { ';e', '<cmd>Telescope diagnostics<cr>' },
        { ';;', '<cmd>Telescope resume<cr>' },
        { '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end},
    }
}


