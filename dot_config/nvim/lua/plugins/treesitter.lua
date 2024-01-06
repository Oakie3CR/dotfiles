return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = "andymass/vim-matchup",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "vim",
        "java",
        "graphql",
        "json",
        "javascript",
        "dockerfile",
        "tsx",
        "typescript",
        "yaml",
        "css",
        "bash",
      },
      matchup = {
        enabled = true,
      },
    })
  end,
}
