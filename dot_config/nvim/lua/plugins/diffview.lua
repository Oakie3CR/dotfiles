return {
  "sindrets/diffview.nvim",
  keys = {
    -- {
    --   "<leader>gd",
    --   group = "diffview",
    -- },
    {
      "<leader>gdv",
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end,
      desc = "Toggle Diffview window",
    },
  },
  opts = {
    show_help_hints = true,
    use_icons = false,
    view = {
      merge_tool = {
        layout = "diff4_mixed",
      },
    },
  },
}
