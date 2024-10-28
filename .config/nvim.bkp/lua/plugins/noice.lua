return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- routes = {
        --     {
        --         view = "notify",
        --         filter = { event = "msg_showmode" },
        --     },
        -- },
        views = {
            cmdline_popup = {
                -- position = {
                --     row = 5,
                --     col = "50%",
                -- },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    }
}
