-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General deps
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- LSP support, code completion, suggestions
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use "RRethy/vim-illuminate"

  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use 'jose-elias-alvarez/typescript.nvim' -- Typescript LSP server with extra hooks
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  use 'glepnir/lspsaga.nvim' -- LSP UIs

  require('packer').use({  -- Better Code Action menu
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })

  -- Completion
  use 'hrsh7th/nvim-cmp'               -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'           -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lua'           -- LSP completion for vim files
  use 'saadparwaiz1/cmp_luasnip'       -- Snippets source for nvim-cmp
  use "hrsh7th/cmp-buffer"             -- buffer completions
  use "hrsh7th/cmp-path"               -- path completions
  use "hrsh7th/cmp-cmdline"            -- cmdline completions

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}  -- Folding


  use 'ray-x/lsp_signature.nvim'       -- Peek function signature while typing

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  use 'kyazdani42/nvim-tree.lua'

  -- Theme
  use 'tomasiser/vim-code-dark'
  use 'Mofiqul/vscode.nvim'
  use 'xiyaowong/nvim-transparent'

  -- Comment lines command
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'


  -- Syntax highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'


  -- Find stuff
  use 'nvim-telescope/telescope.nvim'
  use 'ThePrimeagen/harpoon'

  use 'ray-x/guihua.lua'  --lua GUI lib
  use 'ray-x/sad.nvim' -- find and replace

  -- Auto clear highlighted text after search
  use 'haya14busa/is.vim'

  -- Utils
  use { 'milkypostman/vim-togglelist', config = function () vim.g.toggle_list_no_mappings = false end}
  use 'tpope/vim-sleuth'
  use 'SmiteshP/nvim-gps'
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'moll/vim-bbye'
  use 'chentoast/marks.nvim'

  use { "akinsho/toggleterm.nvim", tag = 'v1.*' }

  use 'akinsho/nvim-bufferline.lua'

  -- Dashboard Greeting
  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  use "lukas-reineke/indent-blankline.nvim"
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lewis6991/impatient.nvim'                         -- faster startup time
  use 'psliwka/vim-smoothie'


  use {'kevinhwang91/nvim-bqf', ft = 'qf'} -- Better quickfix list
end)


