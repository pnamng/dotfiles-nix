vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.o.expandtab = true
vim.opt.fillchars = {
  eob = " ", 
--   vert = " "
} 
vim.opt.cursorline = true

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

require("lazy").setup({
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
    'rebelot/kanagawa.nvim'
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
  {
    'folke/trouble.nvim'
  },
  -- for code completion
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},
})


vim.g.ale_fixers = {'prettier', 'eslint'}
vim.g.ale_fix_on_save = true

require('nvim-ts-autotag').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').setup{
  pickers = {
    find_files = {
      no_ignore = false,
      theme = "dropdown",
    },
    live_grep = {
      no_ignore = false,
      theme = "dropdown"
    }
  },
}

-- lualine config
require('lualine').setup({
  options = {
    theme = 'kanagawa',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
  }
})

-- local highlight = {
--     "CursorColumn",
--     "Whitespace",
-- }
-- require("ibl").setup {
--     indent = { highlight = highlight, char = "" },
--     whitespace = {
--         highlight = highlight,
--         remove_blankline_trail = false,
--     },
--     scope = { enabled = false },
-- }

-- indent-blankline config
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { 
  scope = { highlight = highlight } ,
  indent = {
    char = "│",
  }
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- tree-sitter configs
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "vue" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    refactor = {
      highlight_definitions = {
        enable = true,
        -- Set to false if you have an `updatetime` of ~100.
        clear_on_cursor_move = true,
      },
      highlight_current_scope = { enable = true },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = true,
        -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },
  },
}

require("kanagawa").setup({
  transparent = true,
  theme = "dragon",
})

require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype 		= "NvimTree",
        text 				= "File Explorer",
        text_align	= "left",
        highlight		= "Directory",
        separator 	= true
      }
    },
    highlights = {
      fill = {
        fg = '#24283b',
        bg = '#24283b'
      },
    }
  }	 
}

-- nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = '20%',
    side = 'left'
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },

  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  update_focused_file = {
    enable = true,
  }
})

-- Define the command to get Node.js version
local command = "node -v"

-- Execute the command
local handle = io.popen(command)
local result = handle:read("*a")
result = result:gsub("[\n\r]", "") 
handle:close()

-- TS directory
local tsDirectory = "/home/ech/.nvm/versions/node/" .. result .. "/lib/node_modules/typescript/lib"

local lspconfig_configs = require'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

require 'lspconfig'.volar.setup {
  filetypes = { 
    'typescript', 
    'javascript', 
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json'
  },
  init_options = {
    typescript = {
      tsdk = tsDirectory,
    },
    documentFeatures = {
      selectionRange 			= true,
      foldingRange 				= true,
      linkedEditingRange 	= true,
      documentSymbol 			= true,
      -- not supported - https://github.com/neovim/neovim/pull/13654
      documentColor 			= false,
      documentFormatting 	= {
        defaultPrintWidth = 100,
      },
    }
  }
}

-- cmp setup 
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['volar'].setup {
  filetypes = { 
    'typescript', 
    'javascript', 
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json'
  },
  init_options = {
    typescript = {
      tsdk = tsDirectory,
    },
    documentFeatures = {
      selectionRange 			= true,
      foldingRange 				= true,
      linkedEditingRange 	= true,
      documentSymbol 			= true,
      -- not supported - https://github.com/neovim/neovim/pull/13654
      documentColor 			= false,
      documentFormatting 	= {
        defaultPrintWidth = 100,
      },
    }
  }
}

require('lspconfig')['tsserver'].setup {}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Set contrast.
-- This configuration option should be placed before `colorscheme everforest`.
-- Available values: 'hard', 'medium'(default), 'soft'
-- vim.g.everforest_background = 'medium'

-- For better performance
-- vim.g.everforest_better_performance = 1

-- For transparency

-- vim.g.everforest_transparent_background = 1

-- after color scheme
-- vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd[[hi VertSplit ctermbg=NONE guibg=NONE]]

vim.cmd("colorscheme kanagawa")

-- vim.cmd[[hi! VertSplit guifg=black guibg=black ctermfg=black ctermbg=black]]
vim.cmd[[hi! LineNr guifg=none guibg=none ctermfg=none ctermbg=none]]
vim.cmd[[hi! TelescopeBorder guifg=none guibg=none ctermfg=none ctermbg=none]]

