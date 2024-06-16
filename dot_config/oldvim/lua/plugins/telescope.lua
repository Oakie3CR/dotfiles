return {
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")
    map("n", "<leader>ff", builtin.find_files, {})
    map("n", "<leader>fg", builtin.live_grep, {})
    map("n", "<leader>fb", builtin.buffers, {})
    map("n", "<leader>fh", builtin.help_tags, {})
    require("telescope").setup({
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
    })
  end,
}
