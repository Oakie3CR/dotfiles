return {
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      {
        "<C-h",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_left()
        end,
      },
      {
        "<C-j>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_down()
        end,
      },
      {
        "<C-k>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_up()
        end,
      },
      {
        "<C-l>",
        mode = { "n", "v" },
        function()
          require("smart-splits").move_cursor_right()
        end,
      },
      {
        "<A-h>",
        mode = { "n", "v" },
        function()
          require("smart-splits").resize_left()
        end,
      },
      {
        "<A-j>",
        mode = { "n", "v" },
        function()
          require("smart-splits").resize_down()
        end,
      },
      {
        "<A-k>",
        mode = { "n", "v" },
        function()
          require("smart-splits").resize_up()
        end,
      },
      {
        "<A-l>",
        mode = { "n", "v" },
        function()
          require("smart-splits").resize_right()
        end,
      },
    },
  },
}
