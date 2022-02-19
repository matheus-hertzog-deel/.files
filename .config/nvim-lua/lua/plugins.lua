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
  --use 'neoclide/coc.nvim', { 'branch': 'release' }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use "RRethy/vim-illuminate"

  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

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
  -- use {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --     }
  --   end,
  --
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  -- }
  use 'ray-x/lsp_signature.nvim'       -- Peek function signature while typing

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'github/copilot.vim'

  -- Icons
  use 'kyazdani42/nvim-tree.lua'

  -- Show buffers in tablike fashion
  use 'akinsho/nvim-bufferline.lua'


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
  -- use 'airblade/vim-gitgutter'
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

  -- Multicursor
  use {'mg979/vim-visual-multi', branch = 'master'}

  -- Utils
  use 'milkypostman/vim-togglelist'
  use 'tpope/vim-sleuth'
  use 'SmiteshP/nvim-gps'
  use 'tpope/vim-rhubarb'
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  }
  use 'windwp/nvim-autopairs'
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'moll/vim-bbye'
  use 'chentau/marks.nvim'
  use 'anuvyklack/pretty-fold.nvim'

  -- Dashboard Greeting
  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lewis6991/impatient.nvim'                         -- faster startup time
  use 'psliwka/vim-smoothie'

  -- Better diagnostic list 
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
          signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
      }
    end
  }

use {'kevinhwang91/nvim-bqf', ft = 'qf'}
end)


