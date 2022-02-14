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

set foldmethod=indent
set nofoldenable

let g:coc_global_extensions = ['coc-json',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-tsserver',
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-explorer',
\ 'coc-tabnine',
\ 'coc-git',
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
  "Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'Mofiqul/vscode.nvim'
  " Comment lines command
  Plug 'tpope/vim-commentary'

  " Bottom status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Git integration
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  " Find stuff, Note: Requires fd to be installed (pacman -S fd)
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'ThePrimeagen/harpoon'

  " Auto clear highlighted text after search
  Plug 'haya14busa/is.vim'

  Plug 'terryma/vim-multiple-cursors'

  " Handle swapfiles and remove swapfiles warnings
  Plug 'gioele/vim-autoswap'

  Plug 'ray-x/guihua.lua'  "lua GUI lib
  Plug 'ray-x/sad.nvim'

  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'

call plug#end()

"""""""""""""""""""
""" Themes
"""""""""""""""""""
let g:vscode_style = "dark"
let g:vscode_transparency = 1
let g:vscode_italic_comment = 1

set t_Co=256
set t_ut=
" colorscheme codedark
colorscheme vscode
"colorscheme wal

" vim-airline theme config
set ttimeoutlen=10
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled=1
"""""""""""""""""""
""" EOF Themes
"""""""""""""""""""

"""""""""""""""""""
""" Remaps
"""""""""""""""""""
let mapleader = " "
nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
"
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

" remove annoying Shift+arrow jumps
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right> 

" make Ag search start from project root instead of current dir
let g:ag_working_path_mode="r"
nmap <leader>ag :Ag<CR> 
nnoremap <leader>rg :Rg<CR>


"""""""""""""""""""
""" Sad
"""""""""""""""""""
" CTRL+F to select the text to refactor
vnoremap <C-f> "ky:Sad <C-r>k 
"""""""""""""""""""
""" EOF Sad
"""""""""""""""""""


"""""""""""""""""""
""" Telescope
"""""""""""""""""""
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

"" TODO: make buffers, live_grep in buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"""""""""""""""""""
""" EOF Telescope
"""""""""""""""""""


"""""""""""""""""""
""" COC
"""""""""""""""""""
nmap <space>e <Cmd>CocCommand explorer<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>ai :Format<CR>
nmap <leader>oi :OR<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for applying codeAction to the current buffer. Ps:this will show fixing suggestions!
nmap <leader>ac  <Plug>(coc-codeaction)
let g:coc_disable_transparent_cursor = 1
"""""""""""""""""""
""" EOF COC
"""""""""""""""""""



"""""""""""""""""""
""" vim-fugitive
"""""""""""""""""""
" <leader>gs for opening git status window
" use dv on unstaged files for vertical diffsplit
nnoremap <leader>gs :Git<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
"""""""""""""""""""
""" EOF vim-fugitive
"""""""""""""""""""


"""""""""""""""""""
""" bufferline
"""""""""""""""""""
nnoremap <silent><S-Tab> :BufferLineCyclePrev<cr>
nnoremap <silent><Tab> :BufferLineCycleNext<cr>
nnoremap <silent><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> gb :BufferLinePick<CR>
"""""""""""""""""""
""" EOF bufferline
"""""""""""""""""""


"""""""""""""""""""
""" Harpoon
"""""""""""""""""""
nnoremap <silent><leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

" nnoremap <silent><C-h> :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap <silent><C-t> :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap <silent><C-n> :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <silent><C-s> :lua require("harpoon.ui").nav_file(4)<CR>
"require("telescope").load_extension('harpoon')
"""""""""""""""""""
""" EOF Harpoon
"""""""""""""""""""


"""""""""""""""""""
""" PLUGIN SETUP
"""""""""""""""""""
lua << EOF
require'sad'.setup({
  diff = 'delta', -- you can use `diff`, `diff-so-fancy`
  ls_file = 'fd', -- also git ls_file
  exact = false, -- exact match
})

require'nvim-treesitter.configs'.setup {
ensure_installed = {'javascript', 'typescript', 'tsx', 'jsdoc'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
  },
  pickers = {
    live_grep = {
      only_sort_text = true
    }
  }
}

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
"""""""""""""""""""
""" EOF PLUGIN SETUP
"""""""""""""""""""


""""""""""""""""""""""
""" Helper Functions
""""""""""""""""""""""
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add :Format command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add :Fold command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add :OR command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"""""""""""""""""""""""""
""" EOF Helper Functions
"""""""""""""""""""""""""
