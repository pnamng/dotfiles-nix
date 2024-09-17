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
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
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
  {
    'lukas-reineke/indent-blankline.nvim'
  },
  {
    'akinsho/bufferline.nvim'
  },
  {
    'github/copilot.vim'
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
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
  -- for code completion
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},
  {
    'AlphaTechnolog/pywal.nvim'
  },
  {
    'elkowar/yuck.vim'
  },
  {
    'ayu-theme/ayu-vim'
  },
  {
    'shaunsingh/nord.nvim'
  }
})


