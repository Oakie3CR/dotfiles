local map = vim.keymap.set

return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment")
    local m = "<leader>/"
    map("n", m, function()
      require("Comment.api").toggle.linewise.current()
    end)
    map("v", m, '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>')
  end,
}
