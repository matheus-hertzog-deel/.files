vim.g.mapleader = " "

vim.keymap.set('n', '<C-a>', 'ggVG')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set('n', 'x', '"_x') -- disable yank on x

vim.keymap.set('x', '<leader>p', "\"_dP") -- paste in visual mode without losing register

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")


vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set('v', '/', "<ESC>/\\%V" ) -- search inside select visual lines
--
-- Esc to detach from terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- JSON utils
vim.cmd("command! JqParseFile %!jq '. | fromjson'")
vim.cmd("command! JqParseSelection '<,'>!jq '. | fromjson'")
vim.cmd("command! JqFormatFile %!jq .")
vim.cmd("command! JqFormatSelection '<,'>!jq .")
vim.cmd("command! JqClose %!jq . -c")
vim.cmd("command! JqCloseSelection '<,'>!jq . -c")

local autocmd = vim.api.nvim_create_autocmd
local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
