return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
        'luukvbaal/statuscol.nvim',
    },
    verylazy = true,
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
            },
          })
        local ufo = require('ufo')
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:󰥭]]
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)

        -- Tell the server the capability of foldingRange,
        -- -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities.textDocument.foldingRange = {
            --     dynamicRegistration = false,
            --     lineFoldingOnly = true
            -- }
            -- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
            -- for _, ls in ipairs(language_servers) do
            --     require('lspconfig')[ls].setup({
                --         capabilities = capabilities
                --         -- you can add other fields for setting up lsp server in this table
                --     })
                -- end
                -- require('ufo').setup()
                --

                -- Option 3: treesitter as a main provider instead
                -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
                -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
                -- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
                ufo.setup({
                    provider_selector = function(bufnr, filetype, buftype)
                        return {'treesitter', 'indent'}
                    end
                })



            end
        }

