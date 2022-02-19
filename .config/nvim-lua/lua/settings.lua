local o = vim.opt
local g = vim.g

o.errorbells = false
o.encoding = 'UTF-8'
o.showmatch = true

o.relativenumber = true
o.number = true          -- show current line number

-- Tabs
o.expandtab = true       -- expandtabs turn tabs into spaces
o.shiftwidth=4
o.tabstop=4
o.smarttab = true

-- Indentation
o.autoindent = true      -- copies current indentation when creating new lines
o.smartindent = true
o.wrap = true


o.smartcase = true
o.smartindent = true
o.smarttab = true

-- Swapfiles && backup
o.backup = false
o.undodir = vim.fn.expand("~/.vim/undodir")
o.undofile = true
o.swapfile = false
o.updatetime = 300  -- how long before writting to swapfile

o.lazyredraw = true
o.showmode = false

o.autoread = true
o.incsearch = true

o.termguicolors = true

o.clipboard = 'unnamedplus'

o.hidden = true

o.splitbelow  = true
o.splitright = true
o.equalalways = false

-- cursor offset from screen (keep cursor centered)
o.scrolloff = 8

o.mouse = 'a'
o.shell = '/usr/bin/fish'


o.completeopt = { 'menuone', 'noselect' }

o.pumheight = 10   -- popup menu height

o.signcolumn = 'yes'

o.guifont = 'monospace:h17'


vim.g.cursorhold_updatetime = 100

-- Folding
o.syntax = 'on'
o.foldenable = true
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 99

-- Native highlight yanked
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])
