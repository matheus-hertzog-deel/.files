syntax on 
filetype plugin indent on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set relativenumber
set showmatch

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set termguicolors

set clipboard=unnamedplus

set path+=**
set wildmenu
set wildignore+=**/node_modules/**,**/dist/**
set hidden

set splitbelow 
set splitright
set noequalalways

" always uses spaces instead of tab characters
set expandtab

set mouse=a
set shell=/usr/bin/fish

let g:coc_global_extensions = ['coc-json',
      \'coc-eslint',
      \'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \]

call plug#begin('~/.vim/plugged')

  " LSP support, code completion, suggestions and more
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  
  " File tree navigation with icons
  "  Web-devicons Recommended (for coloured icons)'
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'
  
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Show buffers in tablike fashion
  Plug 'akinsho/nvim-bufferline.lua'

  " NVIM theme
  Plug 'tomasiser/vim-code-dark'
  "Plug 'dylanaraps/wal.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Comment lines command
  Plug 'preservim/nerdcommenter'
  "
  " Open brackets, commas, etc in pairs
  Plug 'jiangmiao/auto-pairs'

  " Bottom status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Git integration
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Solidity syntax highlight
  Plug 'tomlion/vim-solidity'

  " Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  " Find stuff, Note: Requires fd to be installed (pacman -S fd)
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " treesitter feels slow on opening files, try this instead
  "Plug 'HerringtonDarkholme/yats.vim'
  "Plug 'MaxMEllon/vim-jsx-pretty'
  
  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'
  " Auto clear highlighted text after search
  Plug 'haya14busa/is.vim'

  " Handle swapfiles and remove swapfiles warnings
  Plug 'gioele/vim-autoswap'

call plug#end()


set t_Co=256
set t_ut=
"colorscheme codedark
colorscheme dracula
"colorscheme wal
let mapleader = " "

 " -- REMAPS --
 
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for applying codeAction to the current buffer. Ps:this will show fixing suggestions!
nmap <leader>ac  <Plug>(coc-codeaction)
let g:coc_disable_transparent_cursor = 1

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>:Ag<cr>

" leader+hjkl to swap between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Esc to detach from :terminal
tnoremap <Esc> <C-\><C-n>

" ctrl+arrow to resize current split
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Fugitive Conflict Resolution
" <leader>gs for opening git status window
" use dv on unstaged files for vertical diffsplit
nnoremap <leader>gs :Gstatus<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

nmap <leader>ag :Ag<CR> 
nnoremap <leader>rg :Rg<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

nnoremap <silent><S-Tab> :BufferLineCycleNext<CR>
inoremap <silent><S-Tab> <C-d>  
nnoremap <silent><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> gb :BufferLinePick<CR>

  " -- PLUGIN CFG --

lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {'javascript', 'typescript', 'tsx', 'jsdoc'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

lua << EOF
require('telescope').setup{
  -- ...
}
EOF

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" vim-airline theme config
set ttimeoutlen=10
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled=1


" make Ag search start from project root instead of current dir
let g:ag_working_path_mode="r"

lua <<EOF
require'bufferline'.setup{
  options = {
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  }
}
EOF



" NVIM Tree Setup
lua <<EOF
-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics     = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}
EOF
