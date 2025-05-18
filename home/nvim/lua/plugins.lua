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

return require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  {
    'nvim-treesitter/nvim-treesitter', branch = 'master'
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "sainnhe/everforest"
  },
  { "pineapplegiant/spaceduck" },
  {
    'lukas-reineke/indent-blankline.nvim'
  },
  {
    'github/copilot.vim'
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      { "ms-jpq/coq_nvim",       branch = "coq" },
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  {
    'windwp/nvim-ts-autotag'
  },
  {
    'nvim-tree/nvim-tree.lua'
  },
  {
    'tpope/vim-surround'
  },
  {
    'dense-analysis/ale'
  },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
        transparent = true
      }
      -- Enable theme
      require('onedark').load()
    end
  }
})
