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
    'neovim/nvim-lspconfig', -- REQUIRED: for native Neovim LSP integration
    lazy = false,            -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim",       branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up', -- if you want to start COQ at startup
        -- Your COQ settings here
      }
    end,
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
  -- {'hrsh7th/cmp-nvim-lsp'},
  -- {'hrsh7th/cmp-buffer'},
  -- {'hrsh7th/cmp-path'},
  -- {'hrsh7th/cmp-cmdline'},
  -- {'hrsh7th/nvim-cmp'},
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
  }
})
