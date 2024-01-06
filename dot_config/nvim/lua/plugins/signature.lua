return {
  "ray-x/lsp_signature.nvim",
  dependencies = "neovim/nvim-lspconfig",
  opts = { -- check to see if I like these settings
    bind = true,
    doc_lines = 0,
    fix_pos = true,
    floating_window = true,
    hi_parameter = "Search",
    hint_enable = true,
    hint_prefix = " ",
    hint_scheme = "String",
    max_height = 22,
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single",
    },
    padding = "",
  },
}
