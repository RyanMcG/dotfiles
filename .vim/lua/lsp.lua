-- Setup language servers.

local on_attach = function(client, bufnr)
  if client.name == 'ruff' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

vim.lsp.config('ruff', {
  on_attach = on_attach,
})

vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

vim.lsp.config('ty', {
  settings = {
    ty = {
      -- Using Ruff's import organizer
      diagnosticMode = "openFilesOnly",
    },
  },
})

-- Rust
vim.lsp.config('rust_analyzer', {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
})

vim.lsp.config('gopls', {
  cmd_env = {GOFLAGS="-tags=integration"}
})

-- Typescript / JavaScript
-- require("typescript-tools").setup {}
-- lspconfig.tsserver.setup {}
vim.lsp.config('vtsls', {
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 6144,
      },
    },
  },
})

vim.lsp.enable('ruff')
-- vim.lsp.enable('pyright')
vim.lsp.enable('ty')

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')
vim.lsp.enable('vtsls')
vim.lsp.enable('jdtls')
