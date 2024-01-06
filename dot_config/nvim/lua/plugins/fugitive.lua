return {
  "tpope/vim-fugitive",
  lazy = true,
  keys = {
    { "<leader>gs", ":Git<CR>" },
    { "<leader>gd", ":Gdiffsplit<CR>" },
    { "<leader>gc", ":Git commit<CR>" },
    { "<leader>gb", ":Git blame<CR>" },
    { "<leader>gl", ":Git log<CR>" },
    { "<leader>gp", ":Git! push<CR>" },
  },
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gcommit",
  },
}
