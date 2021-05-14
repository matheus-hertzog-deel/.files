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

set splitbelow splitright

" always uses spaces instead of tab characters
set expandtab

set mouse=a

let g:coc_global_extensions = ['coc-json',
      \'coc-eslint',
      \'coc-prettier',
      \ 'coc-tsserver',
      \]

call plug#begin('~/.vim/plugged')

  " LSP support, code completion, suggestions and more
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  
  " File tree navigation with icons
  Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
  Plug 'kyazdani42/nvim-tree.lua'

  " Show buffers in tablike fashion
  Plug 'akinsho/nvim-bufferline.lua'

  " NVIM theme
  Plug 'tomasiser/vim-code-dark'
  
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

  " Solidity syntax highlight
  Plug 'tomlion/vim-solidity'

  " Syntax highlight
  "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  " Find stuff, Note: Requires fd to be installed (pacman -S fd)
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " treesitter feels slow on opening files, try this instead
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()



set t_Co=256
set t_ut=
colorscheme codedark

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

" leader+hjkl to swap between splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Esc to detach from :terminal
tnoremap <C-Esc> <C-\><C-n>

" ctrl+arrow to resize current split
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Remap keys for applying codeAction to the current buffer. Ps:this will show fixing suggestions!!
nmap <leader>ac  <Plug>(coc-codeaction)

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
ensure_installed = {'javascript', 'typescript', 'tsx'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

"coc: use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

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
"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#hunks#enabled=0

"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

"let g:airline_powerline_fonts = 1

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
