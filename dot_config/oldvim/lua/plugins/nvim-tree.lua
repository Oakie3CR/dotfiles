return {
  "kyazdani42/nvim-tree.lua",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus",
  },
  enabled = true,
  lazy = true,
  tag = "nightly",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<C-n>", ":NvimTreeToggle <CR>" },
    { "<leader>e", ":NvimTreeFocus <CR>" },
  },
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            exclude = {
              filetype = {
                "notify",
                "packer",
                "qf",
              },
              buftype = {
                "terminal",
              },
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      -- ignore_ft_on_setup = { "dashboard" },
      open_on_tab = false,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        --allow_resize = true,
        side = "left",
        width = 25,
        hide_root_folder = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          webdev_colors = true,
          glyphs = {
            default = "",
            symlink = "",
            git = {
              deleted = "",
              ignored = "◌",
              renamed = "➜",
              staged = "✓",
              unmerged = "",
              unstaged = "✗",
              untracked = "★",
            },
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
        root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }),
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
}
