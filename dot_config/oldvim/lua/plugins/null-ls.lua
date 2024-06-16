return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins

    null_ls.setup({
      debug = true,
      sources = {
        b.formatting.stylua,
        b.formatting.shfmt,
        b.formatting.prettier,
        b.diagnostics.shellcheck.with({
          diagnostics_format = "#{m} [#{c}]",
        }),
      },
    })
  end,
}
