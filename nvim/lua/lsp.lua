-- Define the command to get Node.js version
local command = "node -v"

-- Execute the command
local handle = io.popen(command)
local result = handle:read("*a")
result = result:gsub("[\n\r]", "") 
handle:close()

-- TS directory
local tsDirectory = "/home/ech/.nvm/versions/node/" .. result .. "/lib/node_modules/typescript/lib"

-- local lspconfig_configs = require'lspconfig.configs'
-- local lspconfig_util = require 'lspconfig.util'
local nvim_lsp = require("lspconfig")

nvim_lsp['volar'].setup {
  filetypes = { 
    'vue',
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

nvim_lsp['ts_ls'].setup {}
nvim_lsp['gopls'].setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  }
}

nvim_lsp.nixd.setup({
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})
