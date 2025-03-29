-- Define the command to get Node.js version
-- local command = "node -v"

-- Execute the command
-- local handle = io.popen(command)
-- local result = handle:read("*a")
-- result = result:gsub("[\n\r]", "")
-- handle:close()

-- TS directory
-- local tsDirectory = "/home/ech/.nvm/versions/node/" .. result .. "/lib/node_modules/typescript/lib"

-- local lspconfig_configs = require'lspconfig.configs'
-- local lspconfig_util = require 'lspconfig.util'
local nvim_lsp = require("lspconfig")

nvim_lsp['volar'].setup {
  filetypes = {
    'vue',
  },
  init_options = {
    -- typescript = {
    --   tsdk = tsDirectory,
    -- },
    documentFeatures = {
      selectionRange     = true,
      foldingRange       = true,
      linkedEditingRange = true,
      documentSymbol     = true,
      -- not supported - https://github.com/neovim/neovim/pull/13654
      documentColor      = false,
      documentFormatting = {
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

nvim_lsp.pyright.setup({})
nvim_lsp.lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})
