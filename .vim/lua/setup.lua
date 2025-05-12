require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  disable_max_lines = 30000,
  disable_max_size = 2000000,

  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>ae", "<cmd>AerialToggle!<CR>")

-- require'nvim-treesitter.configs'.setup {
--   -- Automatically install missing parsers when entering buffer
--   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--   auto_install = true,
--   highlight = {
--     enable = true,
--     disable = { "python", "thrift", },
--   }
-- }

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } }
  }
}

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "ruff_fix", "ruff_format" },
    go = { "gofumpt" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 1000, lsp_fallback = true }
  end,
})

vim.api.nvim_create_user_command("ConformDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("ConformEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

fzf = require('fzf-lua')
fzf.setup {}
fzf.register_ui_select()
