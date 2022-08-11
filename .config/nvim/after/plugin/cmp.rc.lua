local status, cmp = pcall(require, "cmp")
if (not status) then return end

local lspkind = require 'lspkind'-- cmp window styling
local luasnip = require('luasnip')

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
   local info = self:info_()
   info.scrollable = false
   return info
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<C-k>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  -- sources = cmp.config.sources({
  --   { name = "nvim_lsp" },
  --   { name = "copilot" },
  --   { name = "nvim_lua" },
  --   { name = "luasnip" },
  --   { name = "buffer" },
  --   -- { name = "cmp_tabnine" },
  --   { name = "path" },
  --   -- { name = "emoji" },
  -- }, {
  --   { name = 'buffer' },
  -- }),
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
  },
  -- formatting = {
  --   format = function(entry, vim_item)
  --     vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
  --     vim_item.menu = ({
  --       nvim_lsp = "[LSP]",
  --       nvim_lua = "[Nvim]",
  --       luasnip = "[Snippet]",
  --       buffer = "[Buffer]",
  --       path = "[Path]",
  --       -- emoji = "[Emoji]",
  --     })[entry.source.name]
  --     return vim_item
  --   end
  -- },

  window = {
      completion = {
          border = border "CmpBorder",
      },
      documentation = {
          border = border "CmpDocBorder",
      },
  },
})


vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
