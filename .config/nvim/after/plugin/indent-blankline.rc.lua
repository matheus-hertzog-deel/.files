local status, blankline = pcall(require, "indent_blankline")
if (not status) then return end

blankline.setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

