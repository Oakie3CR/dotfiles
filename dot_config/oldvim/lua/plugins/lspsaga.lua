return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local saga = require("lspsaga")
    saga.setup()
    local map = vim.keymap.set

    map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
    map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
  end,
}
