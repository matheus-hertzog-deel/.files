local o = vim.opt
local g = vim.g

o.errorbells = false
o.encoding = 'UTF-8'
o.showmatch = true

o.relativenumber = true
o.number = true          -- show current line number

-- Tabs
o.expandtab = true       -- expandtab turn tabs into spaces
o.shiftwidth=4
o.tabstop=4
o.softtabstop=4
o.smarttab = true

-- Indentation
o.autoindent = true      -- copies current indentation when creating new lines
o.smartindent = true
o.wrap = false


o.smartcase = true
o.smartindent = true

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

o.splitbelow = true
o.splitright = true
o.equalalways = false

-- cursor offset from screen (keep cursor centered)
o.scrolloff = 8

o.mouse = 'a'
o.shell = 'fish'


o.completeopt = { 'menuone', 'noselect' }

o.pumheight = 10   -- popup menu height

o.signcolumn = 'yes'

o.guifont = 'monospace:h17'

g.guitablabel='%N %t %M'


vim.g.cursorhold_updatetime = 100


vim.g.copilot_no_tab_map = true




-- Folding
-- o.syntax = 'on'
-- o.foldenable = true
vim.wo.foldcolumn = '0'
vim.wo.foldlevel = 99 
vim.wo.foldenable = true


-- Native highlight yanked
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]])

-- Toggle :Git -- vim.fugitive
vim.cmd([[
  function! ToggleGStatus()
      if buflisted(bufname('.git/index'))
          bd .git/index
      else
          Git
          resize 15
      endif
  endfunction
  command ToggleGStatus :call ToggleGStatus()
  nmap <F3> :ToggleGStatus<CR>
]])
