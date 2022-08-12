local lspconfig = require("lspconfig")
local luasnip = require('luasnip')
local cmp = require('cmp')

-- Util function
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
        noremap = true
    })
end

local flags = {
  debounce_text_change = 150,
}


-- Register diagnostic signs
local signs = {
  { name = "DiagnosticSignError", text = ""},
  { name = "DiagnosticSignWarn", text = ""},
  { name = "DiagnosticSignHint", text = ""},
  { name = "DiagnosticSignInfo", text = ""},
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Better diagnotic popups
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Mappings over LSP fns
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    require 'illuminate'.on_attach(client)
    --
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    -- vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    -- vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    -- vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    -- vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    -- vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    -- vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    -- vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    -- vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    -- vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    --
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "ca", ":CodeActionMenu<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    -- buf_map(bufnr, "n", "gr", ":LspRefs<CR>")
    -- buf_map(bufnr, "n", "K", ":LspHover<CR>")
    -- buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
    -- buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
    -- buf_map(bufnr, "n", "<leader>a", ":LspDiagLine<CR>")
    -- buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    -- buf_map(bufnr, "n", "<leader>rn", ":LspRename<CR>")
    -- 
    -- buf_map(bufnr, "n", "<leader>ai", ":EslintFixAll <CR>")

    -- auto fix on save
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
end


require("luasnip/loaders/from_vscode").lazy_load()


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local lsp_installer = require("nvim-lsp-installer")

local tsserverConfig = {
    on_attach = function(client, bufnr)
        -- disables formatting for tsserver, use null-ls instead
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    flags = flags
}



lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server

    if server.name == "tsserver" then
      opts.on_attach = tsserverConfig.on_attach
      opts.capabilities = tsserverConfig.capabilities
      opts.flags = tsserverConfig.flags
    end

    --
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)


require('ufo').setup({
    provider_selector = function(bufnr, filetype)
        return {'treesitter', 'indent'}
    end
})
