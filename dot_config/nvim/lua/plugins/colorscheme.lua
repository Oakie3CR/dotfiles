return {
  {
    "folke/tokyonight.nvim",
    event = "User LazyColorscheme",
    opts = {
      style = "night",
    },
  },
  {
    "sainnhe/sonokai",
    event = "User LazyColorscheme",
    config = function()
      vim.g.sonokai_style = "shusia"
      vim.g.sonokai_better_performance = 1
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "User LazyColorscheme",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
