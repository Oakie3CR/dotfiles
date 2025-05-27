-- A nice web site to look at more colors is https://vimcolorschemes.com/i/trending
return {
  {
    "sainnhe/sonokai",
    event = "User LazyColorscheme",
    config = function()
      vim.g.sonokai_style = "shusia"
      vim.g.sonokai_better_performance = 1
    end,
  },
  {
    "folke/tokyonight.nvim",
    event = "User LazyColorscheme",
    opts = {
      style = "night",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "User LazyColorscheme",
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    -- lazy = false,
    -- priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
