local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {'catppuccin/nvim', as = 'catppuccin'},

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

  'theprimeagen/harpoon',

  'mbbill/undotree',

  'tpope/vim-fugitive',

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  'nvim-lualine/lualine.nvim',

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  },

  {'akinsho/toggleterm.nvim', version = "*", config = true},

  'mhartington/formatter.nvim',

  {
    'NvChad/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  },

  'APZelos/blamer.nvim',

  'kdheepak/lazygit.nvim',

  'petertriho/nvim-scrollbar',

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  -- Useful status updates for LSP
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end
  },

  { "folke/neodev.nvim", opts = {} }
})
