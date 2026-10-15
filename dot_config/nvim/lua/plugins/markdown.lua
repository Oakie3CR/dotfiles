return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Replace the inherited formatter list, rather than append to it.
      opts.formatters_by_ft.markdown = {
        "rumdl",
        "markdown-toc",
      }

      opts.formatters = opts.formatters or {}
      opts.formatters.rumdl = {
        args = {
          "fmt",
          "--silent",
          "--stdin-filename",
          "$FILENAME",
          "-",
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- rumdl's language server provides Markdown diagnostics instead.
      opts.linters_by_ft.markdown = {}
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rumdl = {
          root_markers = {
            ".rumdl.toml",
            "rumdl.toml",
            ".git",
          },
          -- Keep Marksman responsible for navigation and headings.
          init_options = {
            enableLinkCompletions = false,
            enableLinkNavigation = false,
            enableSymbols = false,
          },
        },
      },
    },
  },
}
