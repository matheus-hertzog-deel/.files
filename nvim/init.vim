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


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'codota/tabnine-vim'  " -- feels kinda slow
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
Plug 'ryanoasis/vim-devicons'

"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdcommenter'
"Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
Plug 'tomlion/vim-solidity'
call plug#end()

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h 

set t_Co=256
set t_ut=
colorscheme codedark

let mapleader = " "
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nnoremap <C-p> :GFiles<CR>

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

" vim-fugitive conflict resolutions remaps
" gj: pick from left side
" gf: pick from right side
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR> 
nmap <leader>gf :diffget //2<CR>

nnoremap <leader>rg :Rg<CR>
" --NERDTree
nmap <C-n> :NERDTreeToggle %<CR>
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1
" NERDTree color highlights

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" COC config
" use <tab> for trigger completion and navigate to the next complete item
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

" ALE config
"let g:ale_fixers = {
 "\ 'javascript': ['eslint']
 "\ }

"let g:ale_fix_on_save = 1


" vim-airline theme config
set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts = 1

" make Ag search start from project root instead of current dir
let g:ag_working_path_mode="r"

