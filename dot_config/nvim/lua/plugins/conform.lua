return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      ["markdown-toc"] = {
        prepend_args = { "--bullets", "*" },
      },
    },
  },
}
