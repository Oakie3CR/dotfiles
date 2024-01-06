return {
  "catppuccin/nvim",
  lazy = true,
  config = function()
    require("catppuccin").setup()

    vim.cmd([[colorscheme catppuccin]])
  end,
}
